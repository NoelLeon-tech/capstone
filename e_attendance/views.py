from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib.auth import logout
from django.urls import reverse
from .models import *
import datetime

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
        "attendances": student.attendances.filter(meeting___class=_class),
        "class": _class
    })


def scan(request):
    return render(request, "e_attendance/scan.html")


def logout_view(request):
    logout(request)
    return redirect(reverse("e_attendance:index"))