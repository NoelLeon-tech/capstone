# Generated by Django 4.1.3 on 2022-11-13 07:05

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('e_attendance', '0010_attendansu_session_class_students_and_more'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Attendansu',
            new_name='Attendance',
        ),
    ]
