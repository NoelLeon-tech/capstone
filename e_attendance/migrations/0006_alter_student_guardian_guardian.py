# Generated by Django 4.1.3 on 2022-12-10 12:32

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('e_attendance', '0005_alter_employee_attendance_time_out'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student_guardian',
            name='guardian',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='students', to=settings.AUTH_USER_MODEL),
        ),
    ]
