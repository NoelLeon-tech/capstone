from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

########################### Start User Models #################################
class User(AbstractUser):
    address = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    STUDENT_TYPE_CHOICES = [
        ("college student", "college student"),
        ("senior high student", "senior high student")
    ]
    student_type = models.CharField(max_length=20, choices=STUDENT_TYPE_CHOICES)
    course = models.ForeignKey(
        "Course", 
        on_delete=models.SET_NULL, 
        related_name="students", 
        null=True,
        blank=True
    )
    strand = models.ForeignKey(
        "Strand", 
        on_delete=models.SET_NULL, 
        related_name="students", 
        null=True,
        blank=True
    )
    year = models.IntegerField()
    block = models.IntegerField()

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"


class Teacher(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    department = models.ForeignKey(
        "Department", 
        on_delete=models.SET_NULL, 
        related_name="teachers", 
        null=True,
        blank=True
    )

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"
########################### End User Models #################################

########################### Other Models  #################################
class Course(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Track(models.Model):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name


class Strand(models.Model):
    name = models.CharField(max_length=50)
    track = models.ForeignKey(Track, on_delete=models.CASCADE)

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


class Class(models.Model):
    subject = models.ForeignKey(
        Subject, 
        on_delete=models.SET_NULL, 
        null=True
    )
    teacher = models.ForeignKey(
        User, 
        on_delete=models.SET_NULL, 
        related_name="handled_classes",
        null=True
    )
    course = models.ForeignKey(Course, on_delete=models.SET_NULL, blank=True, null=True)
    strand = models.ForeignKey(Strand, on_delete=models.SET_NULL, blank=True, null=True)
    year = models.IntegerField()
    block = models.IntegerField()
    school_year = models.IntegerField()
    semester = models.IntegerField()

    def __str__(self):
        return f"{self.subject} - {self.teacher}"

    class Meta:
        verbose_name_plural  =  "Classes"


class Class_Schedule(models.Model):
    cls = models.ForeignKey(
        Class, 
        on_delete=models.CASCADE, 
        related_name="schedules", 
        db_column="class_id"
    )
    start_time = models.TimeField()
    end_time = models.TimeField()
    DAY_CHOICES = [
        ("Monday", "Monday"),
        ("Tuesday", "Tuesday"),
        ("Wednesday", "Wednesday"),
        ("Thursday", "Thursday"),
        ("Friday", "Friday"),
        ("Saturday", "Saturday")
    ]
    day = models.CharField(max_length=10, choices=DAY_CHOICES)

    def __str__(self):
        return f"{self.day}: {self.start_time.strftime('%I:%M %p')} - {self.end_time.strftime('%I:%M %p')}"


class Class_Student(models.Model):
    cls = models.ForeignKey(Class, on_delete=models.CASCADE, db_column="class_id")
    student = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.cls} - {self.student}"

    class Meta:
        unique_together = ["cls", "student"]


class Student_Guardian(models.Model):
    student = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name="guardians")
    guardian = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name="children")
    relationship_to_student = models.CharField(max_length=20)


class Student_Attendance(models.Model):
    cls = models.ForeignKey(
        Class,
        on_delete=models.CASCADE,
        db_column="class_id"
    )
    student = models.ForeignKey(User, on_delete=models.CASCADE)
    class_schedule = models.ForeignKey(Class_Schedule, on_delete=models.SET_NULL, null=True)
    time_in = models.TimeField()
    date = models.DateField()
    REMARKS_CHOICES = [
        ("On time", "On time"),
        ("Late", "Late")
    ]
    remarks = models.CharField(max_length=20, choices=REMARKS_CHOICES)

    class Meta:
        unique_together = ["cls", "student", "date"]


class Employee_Attendance(models.Model):
    employee = models.ForeignKey(User, on_delete=models.CASCADE, related_name="employee_attendances")
    time_in = models.TimeField()
    time_out = models.TimeField(blank=True, null=True)
    date = models.DateField()
    REMARKS_CHOICES = [
        ("On time", "On time"),
        ("Late", "Late")
    ]
    remarks = models.CharField(max_length=20, choices=REMARKS_CHOICES)

    class Meta:
        unique_together = ["employee", "date"]


class Message(models.Model):
    sender = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name="outbox")
    receiver = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, related_name="inbox")
    content = models.CharField(max_length=500)
    date_sent = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)

    def to_dict(self):
        return {
            "sender": self.sender_id,
            "receiver": self.receiver_id,
            "content": self.content,
            "date_sent": self.date_sent.strftime('%b %d, %Y, %I:%M %p'),
            "is_read": self.is_read
        }
