# Generated by Django 4.1.3 on 2022-12-05 08:25

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('e_attendance', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Student_Attendance',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('time_in', models.TimeField()),
                ('date', models.DateField()),
                ('remarks', models.CharField(choices=[('On time', 'On time'), ('Late', 'Late')], max_length=20)),
                ('class_schedule', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='e_attendance.class_schedule')),
                ('cls', models.ForeignKey(db_column='class_id', on_delete=django.db.models.deletion.CASCADE, related_name='student_attendances', to='e_attendance.class')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='student_attendances', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'unique_together': {('cls', 'student', 'date')},
            },
        ),
        migrations.CreateModel(
            name='Teacher_Attendance',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('time_in', models.TimeField()),
                ('time_out', models.TimeField()),
                ('date', models.DateField()),
                ('remarks', models.CharField(choices=[('On time', 'On time'), ('Late', 'Late')], max_length=20)),
                ('teacher', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='teacher_attendances', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'unique_together': {('teacher', 'date')},
            },
        ),
        migrations.DeleteModel(
            name='Attendance',
        ),
    ]
