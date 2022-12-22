from django.shortcuts import redirect, render
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import logout
from django.urls import reverse
from .models import *
import datetime
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required
import qrcode
from django.contrib import messages
import json
from django.db.models import Q
from .helpers import *

# Create your views here.

##################################### Functions common to all users ####################################
@login_required
def index(request):
    context = {}
    # Get form data
    school_year = request.GET.get("school_year")
    semester = request.GET.get("semester")
    course_id = request.GET.get("course_id")
    strand_id = request.GET.get("strand_id")
    # Check if the logged in user is a student.
    if request.user.groups.filter(name="students").exists():
        class_students = Class_Student.objects.filter(student=request.user)
        context = {
            "class_students": filter_classes(
                class_students=class_students, school_year=school_year, semester=semester
            ),
            "school_years": get_school_years(class_students=class_students),
            "semesters": get_semesters(class_students=class_students)
        }
    # Check if the logged in user is a teacher.
    elif request.user.groups.filter(name="teachers").exists():
        classes = request.user.handled_classes.all()
        context = {
            "classes": filter_classes(
                classes=classes, 
                school_year=school_year, 
                semester=semester, 
                course_id=course_id, 
                strand_id=strand_id
            ),
            "school_years": get_school_years(classes=classes),
            "semesters": get_semesters(classes=classes),
            "courses": get_courses(classes=classes),
            "strands": get_strands(classes=classes)
        }
    # Check if the logged in user is a guardian.
    elif request.user.groups.filter(name="guardians").exists():
        class_students = Class_Student.objects.filter(student__guardians__guardian=request.user)
        context = {
            "class_students": filter_classes(
                class_students=class_students, 
                school_year=school_year, 
                semester=semester, 
                course_id=course_id, 
                strand_id=strand_id
            ),
            "school_years": get_school_years(class_students=class_students),
            "semesters": get_semesters(class_students=class_students),
            "courses": get_courses(class_students=class_students),
            "strands": get_strands(class_students=class_students)
        }
    return render(request, "e_attendance/index.html", context=context)


@login_required
def view_profile(request):
    return render(request, "e_attendance/profile.html")

################################################################################################

######################## Functions common to students and guardians ############################
@login_required
def get_student_attendances(request, class_id, student_id=None):
    context = {}
    cls = Class.objects.get(pk=class_id)
    # Check if the logged in user is a student.
    if request.user.groups.filter(name="students").exists():
        student = User.objects.get(pk=request.user.id)
        context = {
            "class": cls,
            "student_attendances": Student_Attendance.objects.filter(student=student, cls=cls).order_by("-date"),
        }
    # This means the logged in user is a guardian.
    else:
        student = User.objects.get(pk=student_id)
        context = {
            "class": cls,
            "student": student,
            "student_attendances": Student_Attendance.objects.filter(student=student, cls=cls),
        }
    return render(request, "e_attendance/student_attendances.html", context=context)
################################################################################################

############################### Functions specific to students ####################################
@login_required
def scan_attendance_qr(request):
    return render(request, "e_attendance/scan_attendance_qr.html")


@login_required
def attend_class(request, class_schedule_id):
    student = User.objects.get(pk=request.user.id)
    class_schedule = Class_Schedule.objects.get(pk=class_schedule_id)
    cls = class_schedule.cls
    # Get current date and time.
    now = datetime.datetime.now()

    # If student scanned the qr after class.
    if now.time() > class_schedule.end_time:
        messages.add_message(
            request, 
            messages.ERROR, 
            f"The class has already ended."
        )
        return HttpResponse(status=400)

    try:
        # Check if student attended the class within 15 minutes since the class started.
        date = datetime.date(1, 1, 1)
        time_in = now.time()
        time_diff = datetime.datetime.combine(date, time_in) - datetime.datetime.combine(date, class_schedule.start_time)
        time_diff_in_minutes = int(time_diff.total_seconds() / 60)
        # Add student's attendance in the DB.
        Student_Attendance.objects.create(
            cls= cls,
            student=student,
            class_schedule=class_schedule,
            time_in=time_in,
            date=now.date(),
            remarks="On time" if time_diff_in_minutes < 15 else "Late"
        )
    # Show error message if the student already attended the class.
    except IntegrityError:
        messages.add_message(
            request, 
            messages.ERROR, 
            f"You have already attended the class {cls.subject.name}."
        )
        return HttpResponse(status=400)
    # Show success message after student entered the class.
    messages.add_message(
        request, 
        messages.SUCCESS, 
        f"You successfully attended the class {cls.subject.name} today, {now.strftime('%b %d, %Y, %I:%M %p')}"
    )
    return JsonResponse({"class_id": cls.id}, status=201)
##############################################################################################

################################ Functions specific to teachers #################################    
@login_required
def get_class_attendances(request, class_id):
    cls = Class.objects.get(pk=class_id)
    student_attendances = Student_Attendance.objects.filter(cls=cls).order_by("-date")
    class_schedules = cls.schedules.all()
    return render(request, "e_attendance/class_attendances.html", {
        "class": cls,
        "student_attendances": student_attendances,
        "class_schedules": class_schedules
    })


@login_required
def create_attendance_qr(request):
    class_schedule_id = request.POST["class_schedule_id"]
    class_schedule = Class_Schedule.objects.get(pk=class_schedule_id)
    data = reverse("e_attendance:attend_class", args=[class_schedule_id])
    img = qrcode.make(data)
    filename = f"{class_schedule_id}_{datetime.datetime.now().date()}.png"
    img.save(f"e_attendance/static/e_attendance/images/qr_codes/{filename}")
    return render(request, "e_attendance/created_attendance_qr.html", {
        "class": class_schedule.cls,
        "filename": filename
    })
###############################################################################################
@login_required
def employee_attendance(request):
    data = json.loads(request.body)
    user = User.objects.get(pk=data["user_id"])
    now = datetime.datetime.now()
    employee_attendance = None
    try:
        employee_attendance = Employee_Attendance.objects.get(employee=user, date=now.date())
    except Employee_Attendance.DoesNotExist:
        pass
    if employee_attendance:
        employee_attendance.time_out = now.time()
        employee_attendance.save()
        return JsonResponse({"operation": "time-out", "time": now.strftime('%b %d, %Y, %I:%M %p')})
    else:
        date = datetime.date(1, 1, 1)
        time_in = now.time()
        time_diff = datetime.datetime.combine(date, time_in) - datetime.datetime.combine(date, datetime.time(8))
        time_diff_in_minutes = int(time_diff.total_seconds() / 60)

        Employee_Attendance.objects.create(
            employee=user, 
            time_in=now.time(), 
            date=now.date(),
            remarks="On time" if time_diff_in_minutes < 15 else "Late"
        )
        return JsonResponse({"operation": "time-in", "time": now.strftime('%b %d, %Y, %I:%M %p')})


@login_required
def get_employee_attendances(request, user_id):
    return render(request, "e_attendance/employee_attendances.html", {
        "employee_attendances": Employee_Attendance.objects.filter(employee_id=user_id).order_by("-date")
    })


@login_required
def display_messages(request):
    contacts = {}
    if request.user.groups.filter(name="guardians").exists():
        # To get all the students under a guardian, we query the Student_Guardian table
        # and filter it where the guardian is equal to the logged in user.
        student_guardians = Student_Guardian.objects.filter(guardian=request.user)
        # Iterate through the students under the guardian.
        for student_guardian in student_guardians:
            student = student_guardian.student
            # Iterate through the student's classes.
            for class_student in Class_Student.objects.filter(student=student):
                cls = class_student.cls
                student_name =  student.first_name + " " + student.last_name
                teacher_id = cls.teacher_id
                # Check if the class's teacher is already in the contacts dict.
                if teacher_id in contacts:
                    subject = cls.subject.name
                    # If the class's subject is already in the teacher's subjects dict,
                    # add the student to the subject's list of students.
                    if subject in contacts[teacher_id]["subjects"]:
                        contacts[teacher_id]["subjects"][subject].append(student_name)
                    # If the subject is not in the theacher's subjects dict, add it.
                    else:
                        contacts[teacher_id]["subjects"][subject] = [student_name]
                # If the class's teacher is not in the contacts dict, add it.
                else:
                    contacts[teacher_id] = {
                        "subjects": {
                            cls.subject.name: [student_name]
                        },
                        "teacher_name": cls.teacher.first_name + " " + cls.teacher.last_name
                    }
    elif request.user.groups.filter(name="teachers").exists():
        # Get all the classes where the teacher is the logged in user.
        classes = request.user.handled_classes.all()
        # Iterate through each class.
        for cls in classes:
            # Iterate through each student in the class.
            for class_student in Class_Student.objects.filter(cls=cls):
                student = class_student.student
                # Iterate through each guardian of the student.
                for student_guardian in Student_Guardian.objects.filter(student=student):
                    student_name = student.first_name + " " + student.last_name
                    guardian = student_guardian.guardian
                    # If the guardian is already in the contacts dict, add the student 
                    # to its "students" set.
                    if guardian.id in contacts:
                        contacts[guardian.id]["students"].add(student_name)
                    # If it's not in the contacts, add it.
                    else:
                        contacts[guardian.id] = {
                            "guardian_name": guardian.first_name + " " + guardian.last_name,
                            "students": {student_name}
                        }
    return render(request, "e_attendance/messages.html", {"contacts": contacts})


@login_required
def get_messages(request, contact_id):
    contact = User.objects.get(pk=contact_id)
    messages = list(Message.objects.filter(
        Q(sender=request.user) | Q(sender=contact), Q(receiver=request.user) | Q(receiver=contact)
    ).values().order_by("date_sent"))
    return JsonResponse(messages, safe=False)


@login_required
def send_message(request):
    data = json.loads(request.body)
    message = Message.objects.create(
        sender = request.user,
        receiver = User.objects.get(pk=data["receiver_id"]),
        content = data["content"]
    )
    return JsonResponse(message.to_dict(), safe=False)


@login_required
def read_message(request):
    data = json.loads(request.body)
    message = Message.objects.get(pk=data["message_id"])
    message.is_read = True
    message.save()
    return HttpResponse(status=200)


def logout_view(request):
    logout(request)
    return redirect(reverse("login"))

