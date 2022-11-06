from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    # path("student", views.index, name="index"),
    # path("instructor", views.index, name="index"),
    path("login", views.login_view, name="login"),
    path("logout", views.logout_view, name="logout"),
    path("attendance/<int:subject_id>", views.attendance, name="attendance"),
    path("practice", views.practice, name="practice")
    
]