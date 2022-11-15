from django.contrib import admin
from .models import *
from django.contrib.auth.admin import UserAdmin


# Change admin page texts
admin.site.site_header = "E-Attendance Administration"
admin.site.site_title = "E-Attendance"

######################### START MODEL CHANGE LIST PAGE OVERRIDES #########################
class Custom_User_Admin(UserAdmin):
    fieldsets = [
        (None, {'fields': ('username', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'address', 'email')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    ]

class Class_Admin(admin.ModelAdmin):
    list_display = ("subject", "instructor")

class Student_Guardian_Admin(admin.ModelAdmin):
    list_display = ("student", "guardian", "relationship_to_student")

class Attendance_Admin(admin.ModelAdmin):
    list_display = ("meeting", "student", "time_in")

class Meeting_Admin(admin.ModelAdmin):
    list_display = ("_class", "day", "start_time", "end_time", "date", "is_open")

######################### END MODEL CHANGE LIST PAGE OVERRIDES #########################

######################### START MODEL REGISTRATION #########################
admin.site.register(User, Custom_User_Admin)
admin.site.register(Student)
admin.site.register(Instructor)
admin.site.register(Guardian)
admin.site.register(Admin)

admin.site.register(Class, Class_Admin)
admin.site.register(Subject)
admin.site.register(Course)
admin.site.register(Department)
# admin.site.register(Class_Schedule, Class_Schedule_Admin)
admin.site.register(Meeting, Meeting_Admin)

admin.site.register(Attendance, Attendance_Admin)
admin.site.register(Student_Guardian, Student_Guardian_Admin)
######################### END MODEL REGISTRATION #########################
