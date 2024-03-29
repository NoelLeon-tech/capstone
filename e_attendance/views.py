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
from django.core.paginator import Paginator
import xlsxwriter
import os
from django.forms.models import model_to_dict


# Create your views here.

##################################### Functions common to all users ####################################
@login_required
def index(request):
    if request.user.groups.filter(name="guardians").exists():
        return render(request, "e_attendance/index.html", {
            "student_guardians": Student_Guardian.objects.filter(guardian=request.user)
        })
    elif request.user.groups.filter(name="admins").exists():
        return render(request, "e_attendance/index.html", {
            "events": Event.objects.all()
        })
    else:
        return render(request, "e_attendance/index.html")


#============================================= Classes ==========================================================
@login_required
def view_classes(request):
    context = {}
    
    school_year = request.GET.get("school_year") 
    semester = request.GET.get("semester")
    course_id = request.GET.get("course_id")
    strand_id = request.GET.get("strand_id")

    # Student
    if request.user.groups.filter(name="students").exists():
        class_students = Class_Student.objects.filter(student=request.user)
        context = {
            "class_students": filter_classes(
                class_students=class_students, 
                school_year=school_year, 
                semester=semester),
            "school_years": get_school_years(class_students=class_students),
            "semesters": get_semesters(class_students=class_students)
        }

    # Faculty
    elif request.user.groups.filter(name="faculty").exists():
        classes = request.user.handled_classes.all().order_by("-school_year")
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

    # Parent/Guardian
    elif request.user.groups.filter(name="guardians").exists():
        student = User.objects.get(pk=request.GET.get("student_id"))
        class_students = Class_Student.objects.filter(
            student=student, 
            student__guardians__guardian=request.user
        )
        context = {
            "student": student,
            "class_students": filter_classes(
                class_students=class_students, 
                school_year=school_year, 
                semester=semester, 
            ),
            "school_years": get_school_years(class_students=class_students),
            "semesters": get_semesters(class_students=class_students),
        }

    elif request.user.groups.filter(name="admins").exists():
        context = {
            "events": Event.objects.all()
        }

    return render(request, "e_attendance/classes.html", context=context)

#======================================== Class Attendance=======================================================
@login_required
def get_class_attendances(request, class_id):
    start_date = request.GET.get("start_date", "0001-01-01")
    end_date = request.GET.get("end_date", datetime.datetime.now().strftime("%Y-%m-%d"))
    page_number = request.GET.get("page_number", 1)
    cls = Class.objects.get(pk=class_id)

    if request.user.groups.filter(name="students").exists():
        class_attendances = Class_Attendance.objects.filter(
            student=request.user, 
            class_meeting__cls=cls, 
            class_meeting__date__range=[start_date, end_date]
        ).order_by("-class_meeting__date")

        paginator = Paginator(class_attendances, 6)
        page = paginator.get_page(page_number)
        
        return render(request, "e_attendance/class_attendances.html", {
            "class": cls,
            "page": page
        })

    # Guardian
    elif request.user.groups.filter(name="guardians").exists():
        student = User.objects.get(pk=request.GET.get("student_id"))
        class_attendances = Class_Attendance.objects.filter(
            student=student, 
            class_meeting__cls=cls,
            class_meeting__date__range=[start_date, end_date]
        ).order_by("-class_meeting__date")
        paginator = Paginator(class_attendances, 6)
        page = paginator.get_page(page_number)
        return render(request, "e_attendance/class_attendances.html", {
            "class": cls,
            "page": page,
            "student": student
        })

    #Faculty
    elif request.user.groups.filter(name="faculty").exists():
        class_meetings = []
        for class_meeting in Class_Meeting.objects.filter(cls=cls, date__range=[start_date, end_date]).order_by("-date"):
            class_meetings.append({
                **model_to_dict(class_meeting),
                "class_attendances": Class_Attendance.objects.filter(class_meeting=class_meeting).order_by("student__last_name"),
                "num_of_present": Class_Attendance.objects.filter(class_meeting=class_meeting).exclude(remarks="Absent").count()
            })
        return render(request, "e_attendance/class_attendances.html", {
            "class": cls,
            "class_meetings": class_meetings,
            "num_of_students": Class_Student.objects.filter(cls=cls).count()
        })


#=========================================Campus Attendance====================================================
@login_required
def get_campus_attendances(request):
    start_date = request.GET.get("start_date", "0001-01-01")
    end_date = request.GET.get("end_date", datetime.datetime.now().strftime("%Y-%m-%d"))
    page_number = request.GET.get("page_number", 1)

    if request.user.groups.filter(name="guardians").exists():
        student = User.objects.get(id=request.GET.get("student_id"))
        campus_attendances = Campus_Attendance.objects.filter(
            user=student, 
            date__range=[start_date, end_date]
        ).order_by("-date")
        paginator = Paginator(campus_attendances, 10)
        page = paginator.get_page(page_number)
        return render(request, "e_attendance/campus_attendances.html", {
            "student": student,
            "page": page
        })

    else:
        campus_attendances = Campus_Attendance.objects.filter(
            user=request.user, 
            date__range=[start_date, end_date]
        ).order_by("-date")
        paginator = Paginator(campus_attendances, 10)
        page = paginator.get_page(page_number)
        return render(request, "e_attendance/campus_attendances.html", {
            "page": page
        })


#=====================================Event Attendance========================================================
@login_required
def get_event_attendances(request):
    start_date = request.GET.get("start_date", "0001-01-01")
    end_date = request.GET.get("end_date", datetime.datetime.now().strftime("%Y-%m-%d"))
    page_number = request.GET.get("page_number", 1)

    if request.user.groups.filter(name="guardians").exists():
        student = User.objects.get(id=request.GET.get("student_id"))
        event_attendances = Event_Attendance.objects.filter(
            student=student, 
            event__date__range=[start_date, end_date]).order_by("-event__date")

        paginator = Paginator(event_attendances, 10)
        page = paginator.get_page(page_number)
        return render(request, "e_attendance/event_attendances.html", {
            "student": student,
            "page": page
        })

    elif request.user.groups.filter(name="students").exists():
        event_attendances = Event_Attendance.objects.filter(
            student=request.user, 
            event__date__range=[start_date, end_date]).order_by("-event__date")

        paginator = Paginator(event_attendances, 10)
        page = paginator.get_page(page_number)
        return render(request, "e_attendance/event_attendances.html", {
            "page": page
        })


#==================================Faculty Attendance======================================================
@login_required
def get_faculty_attendances(request):
    start_date = request.GET.get("start_date", "0001-01-01")
    end_date = request.GET.get("end_date", datetime.datetime.now().strftime("%Y-%m-%d"))
    page_number = request.GET.get("page_number", 1)

    faculty_attendances = Faculty_Attendance.objects.filter(
        faculty=request.user,
        date__range=[start_date, end_date]
    ).order_by("-date")
    paginator = Paginator(faculty_attendances, 10)
    page = paginator.get_page(page_number)

    return render(request, "e_attendance/faculty_attendances.html", {
        "page": page
    })


############################### Functions specific to students ####################################
@login_required
def scan_qr_code(request):
    if request.method == "GET":
        return render(request, "e_attendance/scan_qr_code.html")
    elif request.method == "POST":
        data = json.loads(request.body)
        class_meeting = Class_Meeting.objects.get(pk=data.get("class_meeting_id"))
        cls = class_meeting.cls
        now = datetime.datetime.now()
        
        class_attendance = None

        if Class_Attendance.objects.filter(class_meeting=class_meeting, student=request.user).exists():
            class_attendance = Class_Attendance.objects.get(class_meeting=class_meeting, student=request.user)
            # If the student already timed out, display an error.
            if class_attendance.time_out:
                messages.add_message(
                    request, 
                    messages.ERROR, 
                    f"You have already timed out."
                )
                return HttpResponse(status=400)
            # save the student's time out.
            else: 
                class_attendance.time_out = now.time()
                class_attendance.save()
                messages.add_message(
                    request, 
                    messages.SUCCESS, 
                    f"You successfully timed out of the class '{cls.subject.name}' today, {now.strftime('%b %d, %Y, %I:%M %p')}"
                )
                return JsonResponse({"class_id": cls.id}, status=200)

        # student gonna time in.
        else:
            if not Class_Student.objects.filter(student=request.user, cls=cls).exists():
                messages.add_message(
                    request, 
                    messages.ERROR, 
                    f"You don't belong in this Class"
                )
                return HttpResponse(status=400)
            # If the student timed in when the class is over, display an error.
            if now.time() > class_meeting.end_time:
                messages.add_message(
                    request, 
                    messages.ERROR, 
                    f"The class has already ended."
                )
                return HttpResponse(status=400)
            else:
                # Add student's attendance in the DB.
                Class_Attendance.objects.create(
                    class_meeting= class_meeting,
                    student=request.user,
                    time_in=now.time(),
                    remarks="On time" if calculate_time_diff(now.time(), class_meeting.start_time) < 15 else "Late"
                )
                # Show success message after student entered the class.
                messages.add_message(
                    request, 
                    messages.SUCCESS, 
                    f"You successfully timed in the class '{cls.subject.name}' today, {now.strftime('%b %d, %Y, %I:%M %p')}"
                )
                return JsonResponse({"class_id": cls.id}, status=201)    


####################################### Functions specific to faculty ##########################################    
@login_required
def create_class_meeting_qr_code(request):
    class_id = request.POST.get("class_id")
    start_time = request.POST.get("start_time")
    end_time = request.POST.get("end_time")
    now = datetime.datetime.now()
    
    class_meeting = None
    try:
        class_meeting = Class_Meeting.objects.create(
            cls_id=class_id,
            start_time=datetime.datetime.strptime(start_time, "%H:%M"),
            end_time=datetime.datetime.strptime(end_time, "%H:%M"),
            day=now.strftime("%A"),
            date=now.date()
        )
    except IntegrityError:
        class_meeting = Class_Meeting.objects.get(
            cls_id=class_id, 
            start_time=datetime.datetime.strptime(start_time, "%H:%M"),
            end_time=datetime.datetime.strptime(end_time, "%H:%M"),
            date=now.date()
        )

    data = json.dumps({
        "path": reverse("e_attendance:scan_qr_code"), 
        "class_meeting_id": class_meeting.id
    })
    img = qrcode.make(data)
    filename = f"{class_meeting.id}_{datetime.datetime.now().date()}.png"
    img.save(f"e_attendance/static/e_attendance/images/qr_codes/{filename}")
    return render(request, "e_attendance/created_qr_code.html", {
        "class": class_meeting.cls,
        "filename": filename
    })
# ======================================= Generate Attendance Report ====================================================    
@login_required
def generate_attendance_report(request):
    class_id = request.GET.get("class_id")
    start_date = request.GET.get("start_date")
    end_date = request.GET.get("end_date")

    #Object-Relational Mapping
    cls = Class.objects.get(pk=class_id)
    class_attendances = None
    class_meetings = None
    if (start_date and end_date):
        class_attendances = Class_Attendance.objects.filter(
            class_meeting__cls=cls,
            class_meeting__date__range=[start_date, end_date]
        )
        class_meetings = Class_Meeting.objects.filter(
            cls=cls,
            date__range=[start_date, end_date]
        ).order_by("date")
    else:
        class_attendances = Class_Attendance.objects.filter(class_meeting__cls=cls)
        class_meetings = Class_Meeting.objects.filter(cls=cls).order_by("date")
    
    filename = ""

    if request.user.groups.filter(name="faculty").exists():
        filename = f"{cls.subject.name}-{cls.course.name if cls.course else cls.strand.name}-{cls.year}-{cls.block}.xlsx"
        workbook = xlsxwriter.Workbook(filename)

        h1 = workbook.add_format({"bold": True, "font_size": 16})
        h2 = workbook.add_format({"bold": True, "font_size": 12})
        bold = workbook.add_format({'bold': True})

        worksheet = workbook.add_worksheet()

        worksheet.write(0, 0, "Attendance Report", h1)
        worksheet.write(1, 0, f"Subject: {cls.subject.name}", h2)
        worksheet.write(2, 0, f"Course/Strand: {cls.course.name if cls.course else cls.strand.name}", h2)
        worksheet.write(3, 0, f"Year/Grade: {cls.year}", h2)
        worksheet.write(4, 0, f"Block: {cls.block}", h2)
        first_meeting_date = class_meetings.first().date
        last_meeting_date = class_meetings.last().date
        worksheet.write(5, 0, f"Date range: {first_meeting_date} - {last_meeting_date}", h2)
        worksheet.write(6, 0, f"Number of meetings: {class_meetings.count()}", h2)

        worksheet.write(9, 0, "Last Name", bold)
        worksheet.write(9, 1, "First Name", bold) 
        worksheet.write(9, 2, "Tardiness in hours", bold)
        worksheet.write(9, 3, "Absences in hours", bold)
        worksheet.write(9, 4, "Is dropped?", bold)

        row = 10

        # Loop through each student and encode needed info
        for cs in Class_Student.objects.filter(cls=cls).order_by("student__last_name"):
            # Encode the student's last name
            worksheet.write(row, 0, cs.student.last_name)

            # Encode the student's first name
            worksheet.write(row, 1, cs.student.first_name)

            # Compute and encode student's tardiness.
            late_class_attendances = class_attendances.filter(student=cs.student, remarks="Late")
            hours_late = 0
            for class_attendance in late_class_attendances:
                hours_late += calculate_time_diff_hours(
                    class_attendance.class_meeting.start_time, 
                    class_attendance.time_in
                )
            worksheet.write(row, 2, round(hours_late, 2))
                        
            # Compute and encode student's absences and if dropped.
            absent_class_attendances = class_attendances.filter(student=cs.student, remarks="Absent")
            hours_absent = hours_late
            for class_attendance in absent_class_attendances:
                hours_absent += calculate_time_diff_hours(class_attendance.class_meeting.start_time, class_attendance.class_meeting.end_time)
            
            worksheet.write(row, 3, round(hours_absent, 2))
            worksheet.write(row, 4, "Yes" if (hours_absent) >= (cls.total_hours * .2) else "No")
            row += 1

            # Resize column width
            worksheet.set_column(0, 20, 18)

        workbook.close()
    
    # read file
    file = open(filename, "rb")
    response = HttpResponse(file.read(), content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    response["Content-Disposition"] = f'attachment; filename={filename}'
    file.close()
    os.remove(filename)
    return response

# ======================================= Capture Attendance ======================================================
def capture_attendance(request):
    if request.method == "GET":
        context = {"attendance_type": request.GET.get("attendance_type")}
        event_id = request.GET.get("event_id")
        if event_id:
            context["event"] = Event.objects.get(pk=event_id)
        return render(request, "e_attendance/capture_attendance.html", context=context)

    elif request.method == "POST":
        now = datetime.datetime.now()
        data = json.loads(request.body)
        user = User.objects.get(pk=data.get("user_id"))
        attendance_type = data.get("attendance_type")

        if attendance_type == "campus":
            campus_attendance = None
            try:
                campus_attendances = Campus_Attendance.objects.filter(user=user, date=now.date()).order_by("-id")
                if len(campus_attendances) >= 1: 
                    campus_attendance = campus_attendances[0]
            except Campus_Attendance.DoesNotExist:
                pass
            if not campus_attendance or campus_attendance.time_out != None:
                Campus_Attendance.objects.create(
                    user=user,
                    time_in=now.time(),
                    date=now.date()
                )
                return HttpResponse(f"Successfully timed in at {now.strftime('%b %d, %Y, %I:%M %p')}")
            else:
                campus_attendance.time_out = now.time()
                campus_attendance.save()
                return HttpResponse(f"Successfully timed out at {now.strftime('%b %d, %Y, %I:%M %p')}")
        
        elif attendance_type == "faculty":
            if Faculty_Attendance.objects.filter(faculty=user, date=now.date()).exists():
                faculty_attendance = Faculty_Attendance.objects.get(faculty=user, date=now.date())
                if faculty_attendance.time_out:
                    return HttpResponse("You have already timed out.", status=400)
                else:
                    faculty_attendance.time_out = now.time()
                    faculty_attendance.save()
                    return HttpResponse(f"Successfully timed out at {now.strftime('%b %d, %Y, %I:%M %p')}")
            else:
                Faculty_Attendance.objects.create(
                    faculty=user,
                    time_in=now.time(),
                    date=now.date(),
                    remarks="On time" if calculate_time_diff(now.time(), datetime.time(8)) < 15 else "Late"
                )
                return HttpResponse(f"Successfully timed in at {now.strftime('%b %d, %Y, %I:%M %p')}")

        elif attendance_type == "event":
            event = Event.objects.get(pk=data.get("event_id"))

            if now.time() > event.end_time:
                return HttpResponse("The event has already ended.", status=400)

            if Event_Attendance.objects.filter(student=user, event=event).exists():
                event_attendance = Event_Attendance.objects.get(student=user, event=event)
                if event_attendance.time_out:
                    return HttpResponse("You have already timed out.", status=400)
                else:
                    event_attendance.time_out = now.time()
                    event_attendance.save()
                    return HttpResponse(f"Successfully timed out at {now.strftime('%b %d, %Y, %I:%M %p')}")
            else:
                Event_Attendance.objects.create(
                    event=event,
                    student=user,
                    time_in=now.time(),
                    remarks="On time" if calculate_time_diff(now.time(), event.start_time) < 15 else "Late"
                )
                return HttpResponse(f"Successfully timed in at {now.strftime('%b %d, %Y, %I:%M %p')}")
                
#========================================== Load Messages ========================================================
@login_required
def load_messages(request):
    contacts = {}
    if request.user.groups.filter(name="guardians").exists():
        student_guardians = Student_Guardian.objects.filter(guardian=request.user)
        # Iterate through the students under the guardian.
        for student_guardian in student_guardians:
            student = student_guardian.student
            # Iterate through the student's classes.
            for class_student in Class_Student.objects.filter(student=student):
                cls = class_student.cls
                student_name =  student.first_name + " " + student.last_name
                faculty_id = cls.faculty_id
                # Check if the class's faculty is already in the contacts dict.
                if faculty_id in contacts:
                    subject = cls.subject.name
                    if subject in contacts[faculty_id]["subjects"]:
                        contacts[faculty_id]["subjects"][subject].append(student_name)
                    # If the subject is not in the teacher's subjects dict, add it.
                    else:
                        contacts[faculty_id]["subjects"][subject] = [student_name]
                # If the class's faculty is not in the contacts dict, add it.
                else:
                    contacts[faculty_id] = {
                        "subjects": {
                            cls.subject.name: [student_name],
                        },
                        "faculty_name": cls.faculty.first_name + " " + cls.faculty.last_name
                    }
    elif request.user.groups.filter(name="faculty").exists():
        # Get all the classes where the faculty is the logged in user.
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

# ======================================== Get, Send and Read Messages =======================================================
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
    message = Message.objects.get(pk=data.get("message_id"))
    message.is_read = True
    message.save()
    return HttpResponse(status=200)

#======================================= Generate Model Spreadsheet =============================================
@login_required
def generate_model_spreadsheet(request):
    model_name = request.GET.get("model_name")
    q = request.GET.get("q", "")
    filename = f"{model_name}.xlsx"
    workbook = xlsxwriter.Workbook(filename, {'remove_timezone': True})
    # h1 = workbook.add_format({"bold": True, "font_size": 16})
    # h2 = workbook.add_format({"bold": True, "font_size": 12})
    bold = workbook.add_format({'bold': True})
    worksheet = workbook.add_worksheet()

    if model_name == "user":
        fields = []
        for field in User._meta.get_fields():
            if not field.is_relation:
                fields.append(field.name)

        fields.remove("password")
        fields.remove("username")
        fields.remove("is_superuser")
        fields.remove("is_staff")
        fields.remove("is_active")
        fields.remove("id")
        
        new_fields = [""] * 8
        for field in fields:
            if field == "user_id":
                new_fields[0] = field
            elif field == "last_name":
                new_fields[1] = field
            elif field == "first_name":
                new_fields[2] = field
            elif field == "middle_name":
                new_fields[3] = field
            elif field == "address":
                new_fields[4] = field
            elif field == "email":
                new_fields[5] = field
            elif field == "date_joined":
                new_fields[6] = field
            elif field == "last_login":
                new_fields[7] = field
        
        for i, field in enumerate(new_fields):
            worksheet.write(0, i, field, bold)
            
        for i, user in enumerate(User.objects.filter(
            Q(id__icontains=q) |
            Q(user_id__icontains=q) |
            Q(first_name__icontains=q) |
            Q(middle_name__icontains=q) |
            Q(last_name__icontains=q) |
            Q(groups__name__icontains=q)
        ).order_by("-user_id")):
            user = user.__dict__
            for j, field in enumerate(new_fields):
                if field == "user_id":
                    worksheet.write(i + 1, 0, user.get(field))
                elif field == "last_name":
                    worksheet.write(i + 1, 1, user.get(field))
                elif field == "first_name":
                    worksheet.write(i + 1, 2, user.get(field))
                elif field == "middle_name":
                    worksheet.write(i + 1, 3, user.get(field))
                elif field == "address":
                    worksheet.write(i + 1, 4, user.get(field))
                elif field == "email":
                    worksheet.write(i + 1, 5, user.get(field))
                elif field == "date_joined":
                    if user.get(field):
                        worksheet.write(i + 1, 6, user.get(field).strftime("%Y-%m-%d"))
                elif field == "last_login":
                    if user.get(field):
                        worksheet.write(i + 1, 7, user.get(field).strftime("%Y-%m-%d"))

        
    elif model_name == "class":
        fields = []
        for field in Class._meta.get_fields():
            if field.name != "class_meetings" and field.name != "class_student":
                fields.append(field.name)

        for i, field in enumerate(fields):
            worksheet.write(0, i, field, bold)

        for i, cls in enumerate(Class.objects.filter(
            Q(id__icontains=q) |
            Q(subject__name__icontains=q) |
            Q(faculty__first_name__icontains=q) |
            Q(faculty__last_name__icontains=q) |
            Q(year__icontains=q) |
            Q(course__name__icontains=q) |
            Q(strand__name__icontains=q) |
            Q(block__icontains=q) |
            Q(school_year__icontains=q) |
            Q(semester__icontains=q) |
            Q(total_hours__icontains=q)
        ).order_by("-id")):
            cls = cls.__dict__
            for j, field in enumerate(fields):
                worksheet.write(i + 1, j, cls.get(field))
                
            subject = Subject.objects.get(pk=cls.get("subject_id"))
            worksheet.write(i + 1, 1, subject.name)
            faculty = User.objects.get(pk=cls.get("faculty_id"))
            worksheet.write(i + 1, 2, f"{faculty.last_name}, {faculty.first_name}")
            try:
                course = Course.objects.get(pk=cls.get("course_id"))            
                worksheet.write(i + 1, 3, course.name)
            except:
                pass
            try:
                strand = Strand.objects.get(pk=cls.get("strand_id"))            
                worksheet.write(i + 1, 4, strand.name)
            except:
                pass


    elif model_name == "course":
        fields = []
        for field in Course._meta.get_fields():
            if field.name != "students" and field.name != "class":
                fields.append(field.name) 
    

        for i, field in enumerate(fields):
            worksheet.write(0, i, field, bold)

        for i, course in enumerate(Course.objects.all().order_by("-id")):
            course = course.__dict__  
            for j, field in enumerate(fields):
                worksheet.write(i + 1, j, course.get(field))

    
    elif model_name == "track":
        fields = []
        for field in Track._meta.get_fields():
            if field.name != "strand":
                fields.append(field.name)

        for i, field in enumerate(fields):
            worksheet.write(0, i, field, bold)

        for i, track in enumerate(Track.objects.all().order_by("-id")):
            track = track.__dict__
            for j, field in enumerate(fields):
                worksheet.write(i + 1, j, track.get(field))


    elif model_name == "subject":
        fields = []
        for field in Subject._meta.get_fields():
            if field.name != "class":
                fields.append(field.name)

        for i, field in enumerate(fields):
            worksheet.write(0, i, field, bold)

        for i, subject in enumerate(Subject.objects.all().order_by("-id")):
            subject = subject.__dict__
            for j, field in enumerate(fields):
                worksheet.write(i + 1, j, subject.get(field))


    elif model_name == "student":
        fields = []
        for field in Student._meta.get_fields():
            if field.name != "id":
                fields.append(field.name)

        worksheet.write(0, 1, "Last name", bold)
        worksheet.write(0, 2, "First name", bold)

        for i, field in enumerate(fields):
            if field == "user":
                worksheet.write(0, i + 0, "id", bold)
            else:
                worksheet.write(0, i + 2, field, bold)

        for i, student in enumerate(Student.objects.filter(
            Q(user__last_name__icontains=q) |
            Q(user__first_name__icontains=q) |
            Q(user__user_id__icontains=q) 
            
        ).order_by("-user__id")):
            student = student.__dict__
            user = User.objects.get(pk=student.get("user_id"))
            worksheet.write(i + 1, 1, user.last_name)
            worksheet.write(i + 1, 2, user.first_name)
            
            for j, field in enumerate(fields):
                if field == "user":
                    worksheet.write(i + 1, j + 0, student.get("user_id"))
                elif field == "course" and student.get("course_id"):
                    worksheet.write(i + 1, j + 2, Course.objects.get(pk=student.get("course_id")).name)
                elif field == "strand" and student.get("strand_id"):
                    worksheet.write(i + 1, j + 2, Strand.objects.get(pk=student.get("strand_id")).name)
                else:
                    worksheet.write(i + 1, j + 2, student.get(field)) 


    elif model_name == "student_guardian":
        fields = []
        for field in Student_Guardian._meta.get_fields():
            fields.append(field.name)

        for i, field in enumerate(fields):
           worksheet.write(0, i, field, bold)

        for i, student_guardian in enumerate(Student_Guardian.objects.all().order_by("-id")):
            student_guardian = student_guardian.__dict__
            for j, field in enumerate(fields):
                if field == "student" or field == "guardian":
                    user = User.objects.get(pk=student_guardian.get(field + "_id"))
                    worksheet.write(i + 1, j, f"{user.last_name}, {user.first_name}")
                else:
                    worksheet.write(i + 1, j, student_guardian.get(field))

    
    elif model_name == "strand":
        fields = []
        for field in Strand._meta.get_fields():
            if not field.is_relation:
                fields.append(field.name) 
    
        for i, field in enumerate(fields):
            worksheet.write(0, i, field, bold)

        for i, strand in enumerate(Strand.objects.all().order_by("-id")):
            strand = strand.__dict__  
            for j, field in enumerate(fields):
                worksheet.write(i + 1, j, strand.get(field))

    
    elif model_name == "message":
        fields = []
        for field in Message._meta.get_fields():
            fields.append(field.name)

        for i, field in enumerate(fields):
            worksheet.write(0, i, field, bold)

        for i, message in enumerate(Message.objects.all().order_by("-id")):
            message = message.__dict__
            for j, field in enumerate(fields):
                if field == "sender" or field == "receiver":
                    user = User.objects.get(pk=message.get(field + "_id"))
                    worksheet.write(i + 1, j, f"{user.last_name}, {user.first_name}")
                elif field == "date_sent":
                    worksheet.write(i + 1, j, message.get(field).strftime("%Y-%m-%d"))    
                else:
                    worksheet.write(i + 1, j, message.get(field))

                    
    elif model_name == "faculty_attendance":
        fields = []
        for field in Faculty_Attendance._meta.get_fields():
            fields.append(field.name)

        worksheet.write(0, 1, "user_id", bold)        

        for i, field in enumerate(fields):
            if field == "id":
                worksheet.write(0, 0, field, bold)
            else:
                worksheet.write(0, i + 1, field, bold)

        for i, faculty_attendance in enumerate(Faculty_Attendance.objects.filter(
            Q(id__icontains=q) |
            Q(faculty__first_name__icontains=q) |
            Q(faculty__last_name__icontains=q) |
            Q(date__icontains=q) |
            Q(remarks__icontains=q) |
            Q(faculty__user_id__icontains=q)
        ).order_by("-id")):
            faculty_attendance = faculty_attendance.__dict__
            user = User.objects.get(pk=faculty_attendance.get("faculty_id"))
            worksheet.write(i + 1, 1, user.user_id)
            for j, field in enumerate(fields):
                if field == "id":
                    worksheet.write(i + 1, 0, faculty_attendance.get(field))
                if field == "faculty":
                    user = User.objects.get(pk=faculty_attendance.get(field + "_id"))
                    worksheet.write(i + 1, j + 2, f"{user.last_name}, {user.first_name}")                    
                elif field == "time_in" or field == "time_out":
                    if faculty_attendance.get(field):
                        worksheet.write(i + 1, j + 2, faculty_attendance.get(field).strftime("%I:%M %p"))
                elif field == "date":
                        worksheet.write(i + 1, j + 2, faculty_attendance.get(field).strftime("%Y-%m-%d"))
                else:
                    worksheet.write(i + 1, j + 2, faculty_attendance.get(field))


    elif model_name == "faculty":
        fields = []
        for field in Faculty._meta.get_fields():
            fields.append(field.name)

        worksheet.write(0, 1, "last name", bold)
        worksheet.write(0, 2, "first name", bold)

        for i, field in enumerate(fields):
            if field == "user":
                worksheet.write(0, i + 0, "id", bold)
            else:
                worksheet.write(0, i + 2, field, bold)

        for i, faculty in enumerate(Faculty.objects.all().order_by("-id")):
            faculty = faculty.__dict__
            user = User.objects.get(pk=faculty.get("user_id"))
            worksheet.write(i + 1, 1, user.last_name)
            worksheet.write(i + 1, 2, user.first_name)
            
            for j, field in enumerate(fields):
                if field == "user":
                    worksheet.write(i + 1, j + 0, faculty.get("user_id"))
                elif field == "department":
                    dept = Department.objects.get(pk=faculty.get("department_id"))
                    worksheet.write(i + 1, j + 2, dept.name)

            
    elif model_name == "event":
        fields = []
        for field in Event._meta.get_fields():
            if not field.is_relation:
                fields.append(field.name)

        for i, field in enumerate(fields):
            worksheet.write(0, i, field, bold)

        for i, event in enumerate(Event.objects.all().order_by("-id")):
            event = event.__dict__
            for j, field in enumerate(fields):
                if field == "start_time" or field == "end_time":
                    if event.get(field):
                        worksheet.write(i + 1, j, event.get(field).strftime("%I:%M %p"))
                elif field == "date":
                    worksheet.write(i + 1, j, event.get(field).strftime("%Y-%m-%d"))
                else:    
                    worksheet.write(i + 1, j, event.get(field))


    elif model_name == "event_attendance":
        fields = []
        for field in Event_Attendance._meta.get_fields():
            fields.append(field.name)

        for i, field in enumerate(fields):
            worksheet.write(0, i, field, bold)

        for i, event_attendance in enumerate(Event_Attendance.objects.filter(
            Q(id__icontains=q) |
            Q(event__name__icontains=q) |
            Q(student__first_name__icontains=q) |
            Q(student__last_name__icontains=q)
        ).order_by("-id")):
            event_attendance = event_attendance.__dict__
            for j, field in enumerate(fields):
                if field == "event":
                    event = Event.objects.get(pk=event_attendance.get(field + "_id"))
                    worksheet.write(i + 1, j, event.name)
                elif field == "student":
                    user = User.objects.get(pk=event_attendance.get(field + "_id"))
                    worksheet.write(i + 1, j, f"{user.last_name}, {user.first_name}")
                elif field == "time_in" or field == "time_out":
                    if event_attendance.get(field):
                        worksheet.write(i + 1, j, event_attendance.get(field).strftime("%I:%M %p"))
                else:
                    worksheet.write(i + 1, j, event_attendance.get(field))


    elif model_name == "department":
        fields = []
        for field in Department._meta.get_fields():
            if not field.is_relation:
                fields.append(field.name)

        for i, field in enumerate(fields):
            worksheet.write(0, i, field, bold)

        for i, department in enumerate(Department.objects.all().order_by("-id")):
            department = department.__dict__
            for j, field in enumerate(fields):
                worksheet.write(i + 1, j, department.get(field))

        
    elif model_name == "campus_attendance":
        fields = []
        for field in Campus_Attendance._meta.get_fields():
            fields.append(field.name)

        worksheet.write(0, 1, "user_id", bold)    

        for i, field in enumerate(fields):
            if field == "id":
                worksheet.write(0, 0, field, bold)
            else:
                worksheet.write(0, i + 1, field, bold)

        for i, campus_attendance in enumerate(Campus_Attendance.objects.filter(
            Q(id__icontains=q) |
            Q(user__last_name__icontains=q) |
            Q(user__first_name__icontains=q) |
            Q(date__icontains=q) |
            Q(user__user_id__icontains=q)
        ).order_by("-id")):
            campus_attendance = campus_attendance.__dict__
            user = User.objects.get(pk=campus_attendance.get("user_id"))
            worksheet.write(i + 1, 1, user.user_id)
            for j, field in enumerate(fields):
                if field == "id":
                    worksheet.write(i + 1, 0, campus_attendance.get(field))
                elif field == "user":
                    user = User.objects.get(pk=campus_attendance.get(field + "_id"))
                    worksheet.write(i + 1, j + 1, f"{user.last_name}, {user.first_name}")
                elif field == "time_in" or field == "time_out":
                    if campus_attendance.get(field):
                        worksheet.write(i + 1, j + 1, campus_attendance.get(field).strftime("%I:%M %p"))
                elif field == "date":
                    worksheet.write(i + 1, j + 1, campus_attendance.get(field).strftime("%Y-%m-%d"))
                else:
                    worksheet.write(i + 1, j + 1, campus_attendance.get(field))


    elif model_name == "class_student":
        fields = []
        for field in Class_Student._meta.get_fields():
            fields.append(field.name)

        for i, field in enumerate(fields):
            worksheet.write(0, i, field, bold)

        for i, class_student in enumerate(Class_Student.objects.filter(
            Q(id__icontains=q) | 
            Q(cls__subject__name__icontains=q) |
            Q(student__first_name__icontains=q) | 
            Q(student__last_name__icontains=q) |
            Q(cls__faculty__first_name__icontains=q) |
            Q(cls__faculty__last_name__icontains=q) |
            Q(cls__course__name__icontains=q)
        ).order_by("-id")):
            class_student = class_student.__dict__
            for j, field in enumerate(fields):
                if field == "cls":
                    cls = Class.objects.get(pk=class_student.get(field + "_id"))
                    if cls.course:
                        worksheet.write(i + 1, j, f"{cls.subject}, {cls.faculty}, {cls.course}")
                    else:
                        worksheet.write(i + 1, j, f"{cls.subject}, {cls.faculty}, {cls.strand}")
                elif field == "student":
                    user = User.objects.get(pk=class_student.get(field + "_id"))
                    worksheet.write(i + 1, j, f"{user.last_name}, {user.first_name}")
                else:
                    worksheet.write(i + 1, j, class_student.get(field))


    elif model_name == "class_attendance":
        fields = []
        for field in Class_Attendance._meta.get_fields():
            fields.append(field.name)  

        for i, field in enumerate(fields):          
            worksheet.write(0, i, field, bold)

        for i, class_attendance in enumerate(Class_Attendance.objects.filter(
            Q(id__icontains=q) |
            Q(class_meeting__cls__subject__name__icontains=q) |
            Q(class_meeting__cls__faculty__first_name__icontains=q) |
            Q(class_meeting__cls__faculty__last_name__icontains=q) |
            Q(class_meeting__cls__course__name__icontains=q) |
            Q(student__first_name__icontains=q) |
            Q(student__last_name__icontains=q) |
            Q(time_in__icontains=q) |
            Q(time_out__icontains=q) |
            Q(remarks__icontains=q)
        ).order_by("-id")):
            class_attendance = class_attendance.__dict__
            # user = User.objects.get(pk=class_attendance.get("user_id"))
            # worksheet.write(i + 1, 1, user.user_id)
            for j, field in enumerate(fields):
                if field == "class_meeting":
                    cm = Class_Meeting.objects.get(pk=class_attendance.get(field + "_id"))
                    worksheet.write(i + 1, j, f"{cm}")
                elif field == "student":
                    user = User.objects.get(pk=class_attendance.get(field + "_id"))
                    worksheet.write(i + 1, j, f"{user.last_name}, {user.first_name}")
                elif field == "time_in" or field == "time_out":
                    if class_attendance.get(field):
                        worksheet.write(i + 1, j, class_attendance.get(field).strftime("%I:%M %p"))
                else:
                    worksheet.write(i + 1, j, class_attendance.get(field))


    elif model_name == "class_meeting":
        fields = []
        for field in Class_Meeting._meta.get_fields():
            fields.append(field.name)

        fields.remove("class_attendance")

        for i, field in enumerate(fields):
            if field == "cls":
                worksheet.write(0, i, "class", bold)
            else:    
                worksheet.write(0, i, field, bold)

        for i, class_meeting in enumerate(Class_Meeting.objects.filter(
            Q(id__icontains=q) |
            Q(cls__subject__name__icontains=q) |
            Q(cls__faculty__last_name__icontains=q) |
            Q(cls__faculty__first_name__icontains=q)
        ).order_by("-id")):
            class_meeting = class_meeting.__dict__
            for j, field in enumerate(fields):
                if field == "cls":
                    cls = Class.objects.get(pk=class_meeting.get(field + "_id"))
                    if cls.course:
                        worksheet.write(i + 1, j, f"{cls.subject}, {cls.faculty}, {cls.course}")
                    else:
                        worksheet.write(i + 1, j, f"{cls.subject}, {cls.faculty}, {cls.strand}")
                elif field == "start_time" or field == "end_time":
                    if class_meeting.get(field):
                        worksheet.write(i + 1, j, class_meeting.get(field).strftime("%I:%M %p"))

                elif field == "date":
                    worksheet.write(i + 1, j, class_meeting.get(field).strftime("%Y-%m-%d"))
                else:
                    worksheet.write(i + 1, j, class_meeting.get(field))

    worksheet.set_column(0, 20, 20)

    workbook.close()
    file = open(filename, "rb")
    response = HttpResponse(file.read(), content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    response["Content-Disposition"] = f'attachment; filename={filename}'
    file.close()
    os.remove(filename)
    return response


#============================================== Logout ==========================================================
def logout_view(request):
    logout(request)
    return redirect(reverse("login"))

