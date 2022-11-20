from django.shortcuts import redirect, render
from django.http import HttpResponse, JsonResponse
from django.contrib.auth import logout
from django.urls import reverse
from .models import *
import datetime
from django.db import IntegrityError

# Create your views here.
def index(request):
    if request.user.is_authenticated:
        school_year = request.GET.get("school-year", datetime.date.today().year)
        semester = request.GET.get("semester", 2)
        context = {}
        if request.user.groups.filter(name="students").exists():
            student = Student.objects.get(pk=request.user.id)
            context = {
                "classes": student.classes.filter(cls__school_year=school_year, cls__semester=semester),
                "user_type": "student"
            }
        else:
            instructor = Instructor.objects.get(pk=request.user.id)
            classes = instructor.classes.filter(school_year=school_year, semester=semester)
            # Find out what courses the instructor handles in a class
            for c in classes:
                setattr(c, "courses", c.students.values("student__course__name").distinct())
                # Find out how many blocks are in a courses
                for course in c.courses:
                    course["block_count"] = c.students.filter(student__course__name=course["student__course__name"]).values_list("student__block", flat=True).distinct().count()
            context = {
                "classes": classes,
                "user_type": "instructor"
            }
        return render(request, "e_attendance/index.html", context=context)

    else:
        return redirect(reverse("login"))
    

def attendance(request, class_id):
    student = Student.objects.get(pk=request.user.id)
    classs = Class.objects.get(pk=class_id)
    return render(request, "e_attendance/attendance.html", {
        "attendances": student.attendances.filter(classs=classs),
        "class": classs
    })


def scan(request):
    _class = Class.objects.get(pk=2)
    student = Student.objects.get(pk=4)
    now = datetime.datetime.now()
    attendance = None
    try:
        attendance = Attendance.objects.create(
            _class=_class,
            student=student,
            time_in=now.time(),
            start_time=datetime.time(8, 0, 0),
            end_time=datetime.time(9, 30, 0),
            day="T",
            date=now.date()
        )
    except IntegrityError:
        pass
    if attendance:
        return HttpResponse("fuck")
    else:
        return HttpResponse("duck")


def logout_view(request):
    logout(request)
    return redirect(reverse("login"))