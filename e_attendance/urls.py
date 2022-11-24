from django.urls import path
from . import views

app_name = "e_attendance"
urlpatterns = [
    path("", views.index, name="index"),
    path("attendance/class/<int:class_id>", views.attendance, name="attendance"),
    path("scan", views.scan, name="scan"),
    path("accounts/logout", views.logout_view, name="logout"),
    path("try1", views.try1, name="try1")
]