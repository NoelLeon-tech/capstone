from django.shortcuts import redirect, render
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.urls import reverse

# Create your views here.
def index(request):
    if request.user.is_authenticated:
        return render(request, "e_attendance/index.html")
    else:
        return redirect(reverse("login"))
        

def attendance(request, subject_id):
    return render(request, "e_attendance/attendance.html")

