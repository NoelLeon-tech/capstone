from django.urls import path
from . import views

app_name = "e_attendance"
urlpatterns = [
    path("", views.index, name="index"),
    path("attendance/<int:subject_id>", views.attendance, name="attendance"),
    path("accounts/logout", views.logout_view, name="logout"),
    path("scan", views.scan, name="scan"),    
]