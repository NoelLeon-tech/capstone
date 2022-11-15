from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

########################### Start User Models #################################


class User(AbstractUser):
    address = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        # return self.username
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
    students = models.ManyToManyField(
        Student,
        related_name="classes"
    )
    school_year = models.IntegerField()
    semester = models.IntegerField()

    def __str__(self):
        return f"{self.subject} - {self.instructor}"

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


# class Class_Schedule(models.Model):
#     _class = models.ForeignKey(
#         Class, 
#         on_delete=models.SET_NULL, 
#         related_name="schedule", 
#         null=True,
#         db_column="class_id"
#     )
#     DAY_CHOICES = [
#         ("M", "Monday"),
#         ("T", "Tuesday"),
#         ("W", "Wednesday"),
#         ("TH", "Thursday"),
#         ("F", "Friday"),
#         ("S", "Saturday")
#     ]
#     day = models.CharField(max_length=2, choices=DAY_CHOICES)
#     start_time = models.TimeField()
#     end_time = models.TimeField()

#     def __str__(self):
#         return f"{self._class}"


class Meeting(models.Model):
    _class = models.ForeignKey(
        Class,
        on_delete=models.CASCADE,
        related_name="sessions"
    )
    day = models.CharField(max_length=2)
    start_time = models.TimeField()
    end_time = models.TimeField()
    date = models.DateField()
    is_open = models.BooleanField(default=True)

    def __str__(self):
        return f"{self._class}"


########################### Start Many-to-Many Relationships #################################


class Student_Guardian(models.Model):
    student = models.ForeignKey(Student, on_delete=models.SET_NULL, null=True)
    guardian = models.ForeignKey(Guardian, on_delete=models.SET_NULL, null=True)
    relationship_to_student = models.CharField(max_length=20)


class Attendance(models.Model):
    meeting = models.ForeignKey(
        Meeting, 
        on_delete=models.CASCADE,
        related_name="attendees"
    )
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name="attendances")
    time_in = models.TimeField(auto_now_add=True)


########################### End Many-to-Many Relationships #################################
