from django.shortcuts import redirect, render
from django.http import HttpResponse
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
        student = Student.objects.get(pk=request.user.id)
        return render(request, "e_attendance/index.html", {
            "classes": student.classes.filter(school_year=school_year, semester=semester),
        })
    else:
        return redirect(reverse("login"))
        

def attendance(request, class_id):
    student = Student.objects.get(pk=request.user.id)
    _class = Class.objects.get(pk=class_id)
    return render(request, "e_attendance/attendance.html", {
        "attendances": student.attendances.filter(_class=_class),
        "class": _class
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
    return redirect(reverse("e_attendance:index"))