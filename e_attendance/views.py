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

def login_view(request):
    if request.user.is_authenticated:
        return redirect(reverse("index"))
    if request.method == "POST":

        # Attempt to sign user in
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)

        # Check if authentication successful
        if user is not None:
            login(request, user)
            return redirect(reverse("index"))
        else:
            return render(request, "e_attendance/login.html", {
                "message": "Invalid username and/or password."
            })
    else:
        return render(request, "e_attendance/login.html")


def logout_view(request):
    logout(request)
    return redirect(reverse("login"))


def attendance(request, subject_id):
    return render(request, "e_attendance/attendance.html")


def practice(request):
    return render(request, "e_attendance/practice.html")