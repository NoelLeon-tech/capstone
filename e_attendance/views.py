from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib.auth import logout
from django.urls import reverse

from .models import *

# Create your views here.
def index(request):
    if request.user.is_authenticated:
        school_year = request.GET.get("school-year", 2022)
        semester = request.GET.get("semester", 2)
        student = Student.objects.get(pk=request.user.id)
        return render(request, "e_attendance/index.html", {
            "classes": student.classes.filter(school_year=school_year, semester=semester),
            "school_year": school_year,
            "semester": semester
        })
    else:
        return redirect(reverse("login"))
        

def attendance(request, subject_id):
    return render(request, "e_attendance/attendance.html")


def scan(request):
    return render(request, "e_attendance/scan.html")


def logout_view(request):
    logout(request)
    return redirect(reverse("e_attendance:index"))