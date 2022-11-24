from django.urls import path
from . import views
import re

app_name = "e_attendance"
urlpatterns = [
    # Routes common to all users.
    path("", views.index, name="index"),
    path("student/<int:student_id>/select_sy_and_sem", views.display_sy_and_sem_form, name="select_sy_and_sem"),
    path("classes", views.get_classes, name="classes"),
    # Route common to students and guardians.
    path(
        "attendances/class/<int:class_id>/student/<int:student_id>", 
        views.get_student_attendances, 
        name="student_attendances"
    ),
    # Routes specific to students.
    path("scan_attendance_qr", views.scan_attendance_qr, name="scan_attendance_qr"),
    path("attend_class/<int:class_id>/<str:start_time>/<str:end_time>", views.attend_class, name="attend_class"),
    # Routes specific to instructors.
    path("class/<int:class_id>/courses", views.get_courses, name="courses"),
    path("class/<int:class_id>/courses/<int:course_id>", views.get_blocks, name="blocks"),
    path(
        "attendances/class/<int:class_id>/course/<int:course_id>/block/<int:block>", 
        views.get_class_attendances, 
        name="class_attendances"
    ),
    path("create_attendance_qr", views.create_attendance_qr, name="create_attendance_qr"),
    ###########################################################
    path("accounts/logout", views.logout_view, name="logout"),
]