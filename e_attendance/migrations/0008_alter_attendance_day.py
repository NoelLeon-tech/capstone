# Generated by Django 4.1.3 on 2022-11-22 07:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('e_attendance', '0007_rename_classs_attendance_cls_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attendance',
            name='day',
            field=models.CharField(max_length=10),
        ),
    ]
