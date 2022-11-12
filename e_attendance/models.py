from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

########################### Start User Models #################################
class User(AbstractUser):
    address = models.CharField(max_length=100, null=True)
    USER_TYPE_CHOICES = (
        (1, 'student'),
        (2, 'teacher'),
        (3, 'guardian'),
        (4, 'admin'),
    )
    user_type = models.PositiveSmallIntegerField(choices=USER_TYPE_CHOICES, null=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


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

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"


class Instructor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    department = models.ForeignKey(
        "Department", 
        on_delete=models.SET_NULL, 
        related_name="staff", 
        null=True,
        blank=True
    )

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"


class Guardian(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"


class Admin(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"
########################### End User Models #################################


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
    school_year = models.IntegerField()
    semester = models.IntegerField()

    class Meta:
        verbose_name_plural  =  "Classes"


class Course(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Subject(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Department(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name
########################### Start Many-to-Many Relationships #################################
class Student_Guardian(models.Model):
    student = models.ForeignKey(Student, on_delete=models.SET_NULL, null=True)
    guardian = models.ForeignKey(Guardian, on_delete=models.SET_NULL, null=True)
    relationship_to_student = models.CharField(max_length=20)


class Class_Schedule(models.Model):
    _class = models.ForeignKey(
        "Class", 
        on_delete=models.SET_NULL, 
        related_name="schedule", 
        null=True,
        db_column="class_id"
    )
    day = models.CharField(max_length=2)
    start_time = models.TimeField()
    end_time = models.TimeField()
########################### End Many-to-Many Relationships #################################
