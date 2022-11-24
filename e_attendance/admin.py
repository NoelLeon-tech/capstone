from django.contrib import admin
from .models import *
from django.contrib.auth.admin import UserAdmin


# Change admin page texts
admin.site.site_header = "E-Attendance Administration"
admin.site.site_title = "E-Attendance"

######################### START MODEL CHANGE LIST PAGE OVERRIDES #########################
# Tuple is like List except that you can't change its elements.
class Custom_User_Admin(UserAdmin):
    list_display = ["username", "first_name", "last_name", "is_superuser", "is_staff"]
    fieldsets = [
        (None, {'fields': ('username', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'address', 'email')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    ]
    add_fieldsets = [
        (None, {'fields': ('username', 'password1', 'password2')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'address', 'email')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    ]

class Student_Admin(admin.ModelAdmin):
    list_display = ("user", "course", "year", "block")

class Instructor_Admin(admin.ModelAdmin):
    list_display = ("user", "department")

class Class_Admin(admin.ModelAdmin):
    list_display = ("id", "subject", "instructor", "school_year", "semester")

class Student_Guardian_Admin(admin.ModelAdmin):
    list_display = ("student", "guardian", "relationship_to_student")

class Attendance_Admin(admin.ModelAdmin):
    list_display = ("cls", "student", "time_in", "start_time", "end_time", "day", "date")

class Class_Student_Admin(admin.ModelAdmin):
    list_display = ("cls", "student")

class Course_Admin(admin.ModelAdmin):
    list_display = ("id", "name")
######################### END MODEL CHANGE LIST PAGE OVERRIDES #########################

######################### START MODEL REGISTRATION #########################
admin.site.register(User, Custom_User_Admin)
admin.site.register(Student, Student_Admin)
admin.site.register(Instructor, Instructor_Admin)
admin.site.register(Guardian)
admin.site.register(Admin)

admin.site.register(Class, Class_Admin)
admin.site.register(Subject)
admin.site.register(Course, Course_Admin)
admin.site.register(Department)
# admin.site.register(Class_Schedule, Class_Schedule_Admin)

admin.site.register(Class_Student, Class_Student_Admin)
admin.site.register(Attendance, Attendance_Admin)
admin.site.register(Student_Guardian, Student_Guardian_Admin)
######################### END MODEL REGISTRATION #########################
