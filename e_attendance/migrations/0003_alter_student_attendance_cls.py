# Generated by Django 4.1.3 on 2022-12-05 08:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('e_attendance', '0002_student_attendance_teacher_attendance_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student_attendance',
            name='cls',
            field=models.ForeignKey(db_column='class_id', on_delete=django.db.models.deletion.CASCADE, related_name='class_attendances', to='e_attendance.class'),
        ),
    ]