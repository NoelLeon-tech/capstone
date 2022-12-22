from django.contrib import admin
from .models import *
from django.contrib.auth.admin import UserAdmin
from django.urls import reverse
from django.utils.html import format_html
from django import forms
import json

# Change admin page texts
admin.site.site_header = "E-Attendance Administration"
admin.site.site_title = "E-Attendance"

######################### START DJANGO ADMIN MODEL REGISTRATION #########################
@admin.register(User)
class Custom_User_Admin(UserAdmin):
    list_display = ["id", "username", "first_name", "last_name", "get_groups"]
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

    def get_groups(self, obj):
        groups = obj.groups.values_list("name", flat=True).all()
        return ", ".join(groups)
    get_groups.short_description = "Groups"


@admin.register(Student)
class Student_Admin(admin.ModelAdmin):
    list_display = ("user", "year", "block", "student_type", "course", "strand")
    # search_fields = ("user__last_name", )
    
    def lookup_allowed(self, lookup, value):
        return True


@admin.register(Teacher)
class Teacher_Admin(admin.ModelAdmin):
    list_display = ("user", "department")


@admin.register(Course)
class Course_Admin(admin.ModelAdmin):
    list_display = ("id", "name")

    # def get_students(self, obj):
    #     count = obj.students.count()
    #     url = f'{reverse("admin:e_attendance_student_changelist")}?course_id={obj.id}'
    #     return format_html('<a href="{}">{} students</a>', url, count)
    # get_students.short_description = "Students"


@admin.register(Subject)
class Subject_Admin(admin.ModelAdmin):
    list_display = ("id", "name")


@admin.register(Track)
class Track_Admin(admin.ModelAdmin):
    list_display = ("id", "name")


@admin.register(Strand)
class Strand_Admin(admin.ModelAdmin):
    list_display = ("id", "name")


@admin.register(Department)
class Department_Admin(admin.ModelAdmin):
    list_display = ("id", "name", "get_teachers")

    def get_teachers(self, obj):
        count = obj.teachers.count()
        url = f'{reverse("admin:e_attendance_teacher_changelist")}?department_id={obj.id}'
        return format_html('<a href="{}">{} teacher(s)</a>', url, count)
    get_teachers.short_description = "Teachers"


class Class_Admin_Form(forms.ModelForm):
    teacher = forms.ModelChoiceField(queryset=User.objects.filter(groups__name="teachers"))
    
    class Meta:
        model = Class
        fields= "__all__"


@admin.register(Class)
class Class_Admin(admin.ModelAdmin):
    list_display = (
        "id", 
        "subject", 
        "teacher", 
        "year", 
        "course", 
        "strand", 
        "block", 
        "school_year", 
        "semester", 
        "get_students"
    )
    form = Class_Admin_Form

    def get_students(self, obj):
        count = Class_Student.objects.filter(cls=obj).count()
        url = f'{reverse("admin:e_attendance_student_changelist")}?user__class_student__cls_id={obj.id}'
        return format_html('<a href="{}">{} students</a>', url, count)
    get_students.short_description = "Students"

    def lookup_allowed(self, lookup, value):
        return True


@admin.register(Class_Schedule)
class Class_Schedule_Admin(admin.ModelAdmin):
    list_display = ("id", "get_class", "start_time", "end_time", "day")

    def get_class(self, obj):
        url = f'{reverse("admin:e_attendance_class_changelist")}?id={obj.cls.id}'
        return format_html('<a href="{}">{}</a>', url, obj.cls)
    get_class.short_description = "Class"


class Class_Student_Admin_Form(forms.ModelForm):
    student = forms.ModelChoiceField(queryset=User.objects.filter(groups__name="students"))
    
    class Meta:
        model = Class_Student
        fields= "__all__"


@admin.register(Class_Student)
class Class_Student_Admin(admin.ModelAdmin):
    list_display = (
        "id",
        "get_class", 
        "get_student"
    )
    form = Class_Student_Admin_Form

    def get_class(self, obj):
        url = f'{reverse("admin:e_attendance_class_changelist")}?id={obj.cls.id}'
        return format_html('<a href="{}">{}</a>', url, obj.cls)
    get_class.short_description = "Class"

    def get_student(self, obj):
        url = f'{reverse("admin:e_attendance_student_changelist")}?user_id={obj.student.id}'
        return format_html('<a href="{}">{}</a>', url, obj.student)
    get_student.short_description = "Student"


@admin.register(Student_Guardian)
class Student_Guardian_Admin(admin.ModelAdmin):
    list_display = ("id", "get_student", "get_guardian", "relationship_to_student")

    def get_student(self, obj):
        url = f'{reverse("admin:e_attendance_student_changelist")}?user_id={obj.student.id}'
        return format_html('<a href="{}">{}</a>', url, obj.student)
    get_student.short_description = "Student"

    def get_guardian(self, obj):
        url = f'{reverse("admin:e_attendance_user_changelist")}?id={obj.guardian.id}'
        return format_html('<a href="{}">{}</a>', url, obj.guardian)
    get_guardian.short_description = "Guardian"


class Student_Attendance_Admin_Form(forms.ModelForm):
    data = {}
    for cls in Class.objects.all():
        class_students = Class_Student.objects.filter(cls=cls)
        class_schedules = cls.schedules.all()
        data[cls.id] = {
            "students": [
                {
                    "id": cs.student.id, 
                    "first_name": cs.student.first_name, 
                    "last_name": cs.student.last_name
                } for cs in class_students
            ],
            "schedules": [
                {
                    "id": c.id, 
                    "day": c.day, 
                    "start_time": c.start_time.strftime("%I:%M %p"), 
                    "end_time": c.end_time.strftime("%I:%M %p")
                } for c in class_schedules
            ]
        }
    json = json.dumps(data) # python says this is a string but js says it's an object

    cls = forms.ModelChoiceField(
        queryset = Class.objects.all(),
        widget = forms.Select(attrs={
            "onchange": """
                data = """ + json + """;
                let studentSelect = document.querySelector("#id_student");
                while (studentSelect.options.length > 1) {
                    studentSelect.remove(studentSelect.options.length - 1);
                }
                for (let student of data[this.value]['students']) {
                    let option = new Option(student['first_name'] + ' ' + student['last_name'], student['id']);
                    studentSelect.add(option);
                }

                let classScheduleSelect = document.querySelector("#id_class_schedule");
                while (classScheduleSelect.options.length > 1) {
                    classScheduleSelect.remove(classScheduleSelect.options.length - 1);
                }
                for (let sched of data[this.value]['class_schedules']) {
                    let option = new Option(sched['day'] + ': ' + sched['start_time'] + ' - ' + sched['end_time'], sched['id']);
                    classScheduleSelect.add(option);
                }
            """
        })
    )

    class Meta:
        model = Student_Attendance
        fields= "__all__"


@admin.register(Student_Attendance)
class Student_Attendance_Admin(admin.ModelAdmin):
    list_display = ("id", "get_class", "get_student", "get_class_schedule", "time_in", "date", "remarks")
    form = Student_Attendance_Admin_Form

    def get_class(self, obj):
        url = f'{reverse("admin:e_attendance_class_changelist")}?id={obj.cls.id}'
        return format_html('<a href="{}">{}</a>', url, obj.cls)
    get_class.short_description = "Class"

    def get_student(self, obj):
        url = f'{reverse("admin:e_attendance_student_changelist")}?user_id={obj.student.id}'
        return format_html('<a href="{}">{}</a>', url, obj.student)
    get_student.short_description = "Student"
    
    def get_class_schedule(self, obj):
        url = f'{reverse("admin:e_attendance_class_schedule_changelist")}?id={obj.class_schedule.id}'
        return format_html('<a href="{}">{}</a>', url, obj.class_schedule)
    get_class_schedule.short_description = "Class schedule"


class Employee_Attendance_Admin_Form(forms.ModelForm):
    employee = forms.ModelChoiceField(queryset=User.objects.exclude(groups__name="students"))
    
    class Meta:
        model = Employee_Attendance
        fields= "__all__"


@admin.register(Employee_Attendance)
class Employee_Attendance_Admin(admin.ModelAdmin):
    list_display = ("id", "employee", "time_in", "time_out", "date", "remarks")
    form = Employee_Attendance_Admin_Form


@admin.register(Message)
class Message_Admin(admin.ModelAdmin):
    list_display = ("id", "sender", "receiver", "content", "date_sent", "is_read")
######################### END DJANGO ADMIN MODEL REGISTRATION #########################