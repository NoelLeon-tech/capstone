from django.contrib import admin
from .models import *
from django.contrib.auth.admin import UserAdmin
# from django.contrib.auth.forms import UserChangeForm

# Change admin page texts
admin.site.site_header  =  "E-Attendance Administration"
admin.site.site_title = "E-Attendance"


# class CustomUserChangeForm(UserChangeForm):
#     class Meta(UserChangeForm.Meta):
#         model = User

class CustomUserAdmin(UserAdmin):
    # form = CustomUserChangeForm
    # list_display = [field.name for field in User._meta.get_fields()]
    fieldsets = [*UserAdmin.fieldsets, ("User type", {'fields': ("user_type",)})]


# Register your models here.

admin.site.register(User, CustomUserAdmin)
admin.site.register(Student)
admin.site.register(Instructor)
admin.site.register(Guardian)
admin.site.register(Admin)

admin.site.register(Class)
admin.site.register(Subject)
admin.site.register(Course)

admin.site.register(Class_Schedule)
admin.site.register(Student_Guardian)