from django.shortcuts import redirect, render
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import logout
from django.urls import reverse
from .models import *
import datetime
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required
from django.db.models import F
import qrcode
from django.contrib import messages

# Create your views here.

##################################### Functions common to all users ####################################
@login_required
def index(request):
    if request.user.groups.filter(name="guardians").exists():
        guardian = Guardian.objects.get(pk=request.user.id)
        return render(request, "e_attendance/students.html", {
            "students": guardian.students.filter(guardian__user__id=request.user.id).values(
                "student",
                "student__user__first_name",
                "student__user__last_name",
            )
        })
    else:
        return render(request, "e_attendance/sy_and_sem.html")


@login_required
def display_sy_and_sem_form(request, student_id):
    return render(request, "e_attendance/sy_and_sem.html", {
        "student_id": student_id,
        "group": "guardians"
    })


@login_required
def get_classes(request):
    school_year = request.GET["school-year"]
    semester = request.GET["semester"]
    context = {}
    if request.user.groups.filter(name="students").exists():
        student = Student.objects.get(pk=request.user.id)
        context = {
            "classes": student.classes.filter(cls__school_year=school_year, cls__semester=semester),
            "group": "students"
        }
    elif request.user.groups.filter(name="instructors").exists():
        instructor = Instructor.objects.get(pk=request.user.id)
        context = {
            "classes": instructor.classes.filter(school_year=school_year, semester=semester),
            "group": "instructors"
        }
    else:
        student = Student.objects.get(pk=request.GET["student_id"])
        context = {
            "classes": student.classes.filter(cls__school_year=school_year, cls__semester=semester),
            "group": "guardians",
            "student": student
        }
    return render(request, "e_attendance/classes.html", {
        **context,
        "school_year": school_year,
        "semester": semester
    })

# Function common to students and guardians.
@login_required
def get_student_attendances(request, class_id, student_id=None):
    context = {}
    cls = Class.objects.get(pk=class_id)
    if request.user.groups.filter(name="students").exists():
        student = Student.objects.get(pk=request.user.id)
        context = {
            "class": cls,
            "attendances": Attendance.objects.filter(student=student, cls=cls),
            "group": "students"
        }
    else: # It means the logged in user is a guardian.
        student = Student.objects.get(pk=student_id)
        context = {
            "class": cls,
            "student": student,
            "attendances": Attendance.objects.filter(student=student, cls=cls),
            "group": "guardians"
        }
    return render(request, "e_attendance/attendances.html", context=context)


################################################################################################

############################### Functions specific to students ####################################
@login_required
def scan_attendance_qr(request):
    return render(request, "e_attendance/scan_attendance_qr.html")


@login_required
def attend_class(request, class_id, start_time, end_time):
    cls = Class.objects.get(pk=class_id)
    student = Student.objects.get(pk=request.user.id)
    start_time = start_time.split(":")
    end_time = end_time.split(":")
    now = datetime.datetime.now()
    try:
        attendance = Attendance.objects.create(
            cls= cls,
            student=student,
            time_in=now.time(),
            start_time=datetime.time(int(start_time[0]), int(start_time[1])),
            end_time=datetime.time(int(end_time[0]), int(end_time[1])),
            day=now.strftime("%A"),
            date=now.date()
        )
    except IntegrityError:
        messages.add_message(
            request, 
            messages.ERROR, 
            f"You have already attended the class {cls.subject.name}."
        )
        return HttpResponse(status=400)
    messages.add_message(
        request, 
        messages.SUCCESS, 
        f"You successfully attended the class {cls.subject.name} today, {now.strftime('%b %d, %Y, %I:%M %p')}"
    )
    return JsonResponse({"class_id": cls.id}, status=201)
##############################################################################################

################################ Functions specific to instructors #################################
@login_required
def get_courses(request, class_id):
    cls = Class.objects.get(pk=class_id)
    # Find out from what courses the students in the class belong to.
    courses = cls.students.values(course_id=F("student__course")).distinct()
    for course in courses:
        course["name"] = Course.objects.get(pk=course["course_id"]).name
    return render(request, "e_attendance/courses.html", {
        "class": cls,
        "courses": courses
    })


@login_required
def get_blocks(request, class_id, course_id):
    cls = Class.objects.get(pk=class_id)
    # Find out from what blocks the students taking the same class and in the same course belong to.
    blocks = cls.students.filter(student__course_id=course_id).values_list("student__block", flat=True).distinct()
    if len(blocks) > 1:
        return render(request, "e_attendance/blocks.html", {
            "class": cls,
            "course_id": course_id,
            "blocks": blocks
        })
    else:
        return redirect(reverse("e_attendance:class_attendances", args=[cls.id, course_id, blocks[0]]))
    

@login_required
def get_class_attendances(request, class_id, course_id, block):
    cls = Class.objects.get(pk=class_id)
    attendances = Attendance.objects.filter(cls=cls, student__course_id=course_id, student__block=block)
    return render(request, "e_attendance/attendances.html", {
        "class": cls,
        "course_id": course_id,
        "block_num": block,
        "attendances": attendances,
        "group": "instructors"
    })


@login_required
def create_attendance_qr(request):
    class_id = request.POST["class_id"]
    course_id = request.POST["course_id"]
    block = request.POST["block"]
    start_time = request.POST["start_time"]
    end_time = request.POST["end_time"]
    data = reverse("e_attendance:attend_class", args=[class_id, start_time, end_time])
    img = qrcode.make(data)
    filename = f"{class_id}_{start_time.replace(':', '_')}_{end_time.replace(':', '_')}.png"
    img.save(f"e_attendance/static/e_attendance/images/{filename}")
    return render(request, "e_attendance/created_attendance_qr.html", {
        "class": Class.objects.get(pk=class_id),
        "course_id": course_id,
        "block_num": block,
        "filename": filename
    })
###############################################################################################

def logout_view(request):
    logout(request)
    return redirect(reverse("login"))