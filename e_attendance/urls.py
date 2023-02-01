from django.urls import path
from . import views


app_name = "e_attendance"
urlpatterns = [
    # Built-in in Django and Routes common to all.
    path("accounts/logout", views.logout_view, name="logout"),

    # Routes common to students, faculty and guardians.
    path("", views.index, name="index"),
    path("classes", views.view_classes, name="classes"),
    path("class_attendances/<int:class_id>", views.get_class_attendances, name="class_attendances"),
    path("campus_attendances", views.get_campus_attendances, name="campus_attendances"),
    path("event_attendances", views.get_event_attendances, name="event_attendances"),
    path("faculty_attendances", views.get_faculty_attendances, name="faculty_attendances"),
   
    # Routes specific to students.
    path("scan_qr_code", views.scan_qr_code, name="scan_qr_code"),
   
    # Routes specific to faculty.
    path("create_class_meeting_qr_code", views.create_class_meeting_qr_code, name="create_class_meeting_qr_code"),
    path("generate_attendance_report", views.generate_attendance_report, name="generate_attendance_report"),

    # Routes specific to admins.
    path("capture_attendance", views.capture_attendance, name="capture_attendance"),
    path("generate_model_spreadsheet", views.generate_model_spreadsheet, name="generate_model_spreadsheet"),
      
    # Routes specific to faculty and guardians.
    path("messages", views.load_messages, name="messages"),
    path("get_messages/<int:contact_id>", views.get_messages),
    path("send_message", views.send_message),
    path("read_message", views.read_message)
]