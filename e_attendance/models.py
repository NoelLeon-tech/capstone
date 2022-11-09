from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class User(AbstractUser):
    pass


class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    course = models.ForeignKey(
        "Course", 
        on_delete=models.SET_NULL, 
        related_name="students", 
        null=True
    )
    year = models.IntegerField()
    block = models.IntegerField()
    guardians = models.ManyToManyField("Guardian", related_name="wards")


class Instructor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    department = models.ForeignKey(
        "Department", 
        on_delete=models.SET_NULL, 
        related_name="staff", 
        null=True
    )


class Guardian(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    relationship_to_student = models.CharField(max_length=20)


class Class(models.Model):
    subject = models.ForeignKey(
        "Subject", 
        on_delete=models.SET_NULL, 
        related_name="classes",
        null=True
    )
    instructor = models.ForeignKey(
        Instructor, 
        on_delete=models.SET_NULL, 
        related_name="classes",
        null=True
    )


class Course(models.Model):
    name = models.CharField(max_length=50)


class Subject(models.Model):
    name = models.CharField(max_length=50)


class Department(models.Model):
    name = models.CharField(max_length=50)


class ClassSchedule(models.Model):
    _class = models.ForeignKey("Class", on_delete=models.SET_NULL, related_name="schedule", null=True)
    day = models.CharField(max_length=2)
    start_time = models.TimeField()
    end_time = models.TimeField()