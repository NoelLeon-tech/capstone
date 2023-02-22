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
    list_display = ["id", "user_id", "first_name", "middle_name", "last_name", "get_groups"]
    search_fields = ("id", "user_id", "first_name", "middle_name", "last_name", "groups__name")
    fieldsets = [
        # (None, {'fields': ('username', 'password')}),
        (None, {'fields': ('user_id', 'password')}),
        ('Personal info', {'fields': ('first_name', 'middle_name', 'last_name', 'address', 'email')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    ]
    add_fieldsets = [
        # (None, {'fields': ('username', 'password1', 'password2')}),
        (None, {'fields': ('user_id', 'password1', 'password2')}),
        ('Personal info', {'fields': ('first_name', 'middle_name', 'last_name', 'address', 'email')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    ]
    # change_list_template = "e_attendance/user_changelist.html"

    def get_groups(self, obj):
        # SELECT ALL from groups where user_id = user_id
        groups = obj.groups.values_list("name", flat=True).all()
        return ", ".join(groups)
    get_groups.short_description = "Groups"

#==============================================Student===========================================================
@admin.register(Student)
class Student_Admin(admin.ModelAdmin):
    list_display = ("get_user_id", "get_user_last_name", "get_user_first_name", "year", "block", "student_type", "course", "strand")
    search_fields = ("user__last_name", "user__first_name", "user__user_id")
    
    def get_user_id(self, obj):
        return obj.user.user_id
    get_user_id.short_description = 'user id'

    def get_user_last_name(self, obj):
        return obj.user.last_name
    get_user_last_name.short_description = 'last name'

    def get_user_first_name(self, obj):
        return obj.user.first_name
    get_user_first_name.short_description = 'first name'

    # def lookup_allowed(self, lookup, value):
    #     return True


@admin.register(Faculty)
class Faculty_Admin(admin.ModelAdmin):
    list_display = ("user_id", "user", "department")
    search_fields = ("user__last_name", "user__first_name")


@admin.register(Course)
class Course_Admin(admin.ModelAdmin):
    list_display = ("id", "name")
    search_fields = ("id", "name")


@admin.register(Subject)
class Subject_Admin(admin.ModelAdmin):
    list_display = ("id", "name")
    search_fields = ("id", "name")


@admin.register(Track)
class Track_Admin(admin.ModelAdmin):
    list_display = ("id", "name")
    search_fields = ("id", "name")


@admin.register(Strand)
class Strand_Admin(admin.ModelAdmin):
    list_display = ("id", "name")
    search_fields = ("id", "name")


@admin.register(Department)
class Department_Admin(admin.ModelAdmin):
    list_display = ("id", "name", "get_faculty")
    search_fields = ("id", "name", "faculty__first_name")

    def get_faculty(self, obj):
        count = obj.faculty.count()
        url = f'{reverse("admin:e_attendance_faculty_changelist")}?department_id={obj.id}'
        return format_html('<a href="{}">{} faculty(s)</a>', url, count)
    get_faculty.short_description = "faculty"


#=========================================Class================================================================
class Class_Admin_Form(forms.ModelForm):
    faculty = forms.ModelChoiceField(queryset=User.objects.filter(groups__name="faculty"))
    
    class Meta:
        model = Class
        fields= "__all__"


@admin.register(Class)
class Class_Admin(admin.ModelAdmin):
    list_display = (
        "id", 
        "subject", 
        "faculty", 
        "year", 
        "course", 
        "strand", 
        "block", 
        "school_year", 
        "semester",
        "total_hours",
        "get_students"
    )
    search_fields = (
        "id", 
        "subject__name", 
        "faculty__first_name", 
        "faculty__last_name", 
        "year", 
        "course__name", 
        "strand__name",
        "block",
        "school_year",
        "semester",
        "total_hours",
     )
    form = Class_Admin_Form

    def get_students(self, obj):
        count = Class_Student.objects.filter(cls=obj).count()
        url = f'{reverse("admin:e_attendance_student_changelist")}?user__class_student__cls_id={obj.id}'
        return format_html('<a href="{}">{} students</a>', url, count)
    get_students.short_description = "Students"

    def lookup_allowed(self, lookup, value):
        return True


#=======================================Class__Meeting========================================================
@admin.register(Class_Meeting)
class Class_Meeting_Admin(admin.ModelAdmin):
    list_display = ("id", "get_class", "start_time", "end_time", "day", "date")
    search_fields = ("id", "cls__subject__name", "cls__faculty__last_name", "cls__faculty__first_name", "cls__course__name")

    def get_class(self, obj):
        url = f'{reverse("admin:e_attendance_class_changelist")}?id={obj.cls.id}'
        return format_html('<a href="{}">{}</a>', url, obj.cls)
    get_class.short_description = "Class"


#=======================================Class_Student===========================================================
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
    search_fields = (
        "id", "cls__subject__name", "student__first_name", "student__last_name", 
        "cls__faculty__first_name", "cls__faculty__last_name",
        "cls__course__name"
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

#===================================Student_Guardian============================================================
class Student_Guardian_Admin_Form(forms.ModelForm):
    student = forms.ModelChoiceField(queryset=User.objects.filter(groups__name="students"))
    guardian = forms.ModelChoiceField(queryset=User.objects.filter(groups__name="guardians"))
    
    class Meta:
        model = Student_Guardian
        fields= "__all__"


@admin.register(Student_Guardian)
class Student_Guardian_Admin(admin.ModelAdmin):
    form = Student_Guardian_Admin_Form
    list_display = ("id", "get_student", "get_guardian", "relationship_to_student")
    search_fields = (
        "id", "student__first_name", "student__first_name", 
        "guardian__first_name", "guardian__first_name"
    )

    
    def get_student(self, obj):
        url = f'{reverse("admin:e_attendance_student_changelist")}?user_id={obj.student.id}'
        return format_html('<a href="{}">{}</a>', url, obj.student)
    get_student.short_description = "Student"

    def get_guardian(self, obj):
        url = f'{reverse("admin:e_attendance_user_changelist")}?id={obj.guardian.id}'
        return format_html('<a href="{}">{}</a>', url, obj.guardian)
    get_guardian.short_description = "Guardian"


#===========================================Message=========================================================
@admin.register(Message)
class Message_Admin(admin.ModelAdmin):
    list_display = ("id", "sender", "receiver", "content", "date_sent", "is_read")
    search_fields = (
        "id", "sender__first_name", "sender__last_name", 
        "receiver__first_name", "receiver__last_name"
    )


#============================================Event============================================================   
@admin.register(Event)
class Event_Admin(admin.ModelAdmin):
    list_display = ("id", "name", "start_time", "end_time", "date")
    search_fields = ("id", "name", "date")

    
#============================================Class_Attendance================================================
class Class_Attendance_Admin_Form(forms.ModelForm):
    student = forms.ModelChoiceField(queryset=User.objects.filter(groups__name="students"))

    data = {}
    meetings_class_map = {}

    for cls in Class.objects.all():
        data[cls.id] = []
        class_students = Class_Student.objects.filter(cls=cls)
        for cs in class_students:
            data[cls.id].append({
                "id": cs.student.id, 
                "first_name": cs.student.first_name, 
                "last_name": cs.student.last_name
            })
        
        for class_meeting in Class_Meeting.objects.filter(cls=cls):
            meetings_class_map[class_meeting.id] = cls.id

    json_data = json.dumps(data) # python says this is a string but js says it's an object
    json_meetings_class_map = json.dumps(meetings_class_map)

    class_meeting = forms.ModelChoiceField(
        queryset = Class_Meeting.objects.all(),
        widget = forms.Select(attrs={
            "onchange": """
                let data = """ + json_data + """;
                let meetingsClassMap = """ + json_meetings_class_map + """;
                let studentSelect = document.querySelector("#id_student");
                while (studentSelect.options.length > 1) {
                    studentSelect.remove(studentSelect.options.length - 1);
                }
                for (let student of data[meetingsClassMap[this.value]]) {
                    let option = new Option(student['first_name'] + ' ' + student['last_name'], student['id']);
                    studentSelect.add(option);
                }
            """
        })
    )

    class Meta:
        model = Class_Attendance
        fields= "__all__"


@admin.register(Class_Attendance)
class Class_Attendance_Admin(admin.ModelAdmin):
    list_display = ("id", "class_meeting", "get_student", "time_in", "time_out", "remarks")
    search_fields = (
        "id", 
        "class_meeting__cls__subject__name", 
        "class_meeting__cls__faculty__first_name", 
        "class_meeting__cls__faculty__last_name",
        "class_meeting__cls__course__name",
        "student__first_name",
        "student__last_name",
        "time_in",
        "time_out",
        "remarks"
    )
    form = Class_Attendance_Admin_Form

    # def get_class(self, obj):
    #     url = f'{reverse("admin:e_attendance_class_changelist")}?id={obj.cls.id}'
    #     return format_html('<a href="{}">{}</a>', url, obj.cls)
    # get_class.short_description = "Class"

    def get_student(self, obj):
        url = f'{reverse("admin:e_attendance_student_changelist")}?user_id={obj.student.id}'
        return format_html('<a href="{}">{}</a>', url, obj.student)
    get_student.short_description = "Student"
    

#========================================Campus Attendance===================================================
@admin.register(Campus_Attendance)
class Campus_Attendance_Admin(admin.ModelAdmin):
    list_display = ("id", "get_user_id", "user", "time_in", "time_out", "date")
    search_fields = ("id", "user__last_name", "user__first_name", "date", "user__user_id")

    def get_user_id(self, obj):
        return obj.user.user_id
    get_user_id.short_description = 'user id'


#========================================Faculty Attendance======================================================

class Faculty_Attendance_Admin_Form(forms.ModelForm):
    faculty = forms.ModelChoiceField(queryset=User.objects.filter(groups__name="faculty"))
    
    class Meta:
        model = Faculty_Attendance
        fields= "__all__"


@admin.register(Faculty_Attendance)
class Faculty_Attendance_Admin(admin.ModelAdmin):
    list_display = ("id", "get_user_id", "faculty", "time_in", "time_out", "date", "remarks")
    search_fields = (
        "id", 
        "faculty__first_name", 
        "faculty__last_name", 
        "date", 
        "remarks",
        "faculty__user_id"
    )

    def get_user_id(self, obj):
        return obj.faculty.user_id
    get_user_id.short_description = 'user id'

    

    form = Faculty_Attendance_Admin_Form


#=========================================Event Attendance============================================================

class Event_Attendance_Admin_Form(forms.ModelForm):
    student = forms.ModelChoiceField(queryset=User.objects.filter(groups__name="students"))
    
    class Meta:
        model = Event_Attendance
        fields= "__all__"


@admin.register(Event_Attendance)
class Event_Attendance_Admin(admin.ModelAdmin):
    list_display = ("id", "event", "student", "time_in", "time_out", "remarks")
    search_fields = ("id", "event__name", "student__first_name", "student__last_name")
    form = Event_Attendance_Admin_Form
######################### END DJANGO ADMIN MODEL REGISTRATION #########################




