from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("attendance/<int:subject_id>", views.attendance, name="attendance"),
    
]