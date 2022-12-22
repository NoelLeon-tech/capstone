from django.urls import path
from . import views


app_name = "e_attendance"
urlpatterns = [
    # Routes common to all users.
    path("", views.index, name="index"),
    path("profile", views.view_profile, name="view_profile"),
    # Route common to students and guardians.
    path(
        "classes/<int:class_id>/students/<int:student_id>/attendances", 
        views.get_student_attendances, 
        name="student_attendances"
    ),
    # Routes specific to students.
    path("scan_attendance_qr", views.scan_attendance_qr, name="scan_attendance_qr"),
    path("attend_class/<int:class_schedule_id>", views.attend_class, name="attend_class"),
    # Routes specific to teachers.
    path(
        "classes/<int:class_id>/attendances", 
        views.get_class_attendances, 
        name="class_attendances"
    ),
    path("create_attendance_qr", views.create_attendance_qr, name="create_attendance_qr"),
    ###########################################################
    path("employee_attendance", views.employee_attendance, name="employee_attendance"),
    path("employee_attendances/<int:user_id>", views.get_employee_attendances, name="employee_attendances"),
    path("messages", views.display_messages, name="messages"),
    path("get_messages/<int:contact_id>", views.get_messages),
    path("send_message", views.send_message),
    path("read_message", views.read_message),
    path("accounts/logout", views.logout_view, name="logout"),
]