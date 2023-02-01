from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

############################################# USER MODELS ##################################################
class User(AbstractUser):
    middle_name = models.CharField(max_length=100, blank=True, null=True)
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


class Faculty(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    department = models.ForeignKey(
        "Department", 
        on_delete=models.SET_NULL, 
        related_name="faculty", 
        null=True,
        blank=True
    )

    def __str__(self):
        return f"{self.user.first_name} {self.user.last_name}"

    class Meta:
        verbose_name_plural = "Faculty"
######################################### USER MODELS ####################################################

##########################################################################################################
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
    faculty = models.ForeignKey(
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
    total_hours = models.IntegerField()

    def __str__(self):
        return f"{self.subject} - {self.faculty}, {self.course if self.course else self.strand}"

    class Meta:
        verbose_name_plural  =  "Classes"


class Class_Meeting(models.Model):
    cls = models.ForeignKey(
        Class, 
        on_delete=models.CASCADE, 
        db_column="class_id", 
        related_name="class_meetings"
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
    date = models.DateField()

    def __str__(self):
        return f"{self.id} {self.cls} | {self.start_time} - {self.end_time} | {self.date}"
    
    class Meta:
        unique_together = ["cls", "start_time", "end_time", "date"]


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


class Event(models.Model):
    name = models.CharField(max_length=100)
    start_time = models.TimeField()
    end_time = models.TimeField()
    date = models.DateField()

    def __str__(self):
        return self.name
###########################################################################################################

########################################## ATTENDANCE MODELS ##########s###################################
class Class_Attendance(models.Model):
    class_meeting = models.ForeignKey(
        Class_Meeting,
        on_delete=models.CASCADE
    )
    student = models.ForeignKey(User, on_delete=models.CASCADE)
    time_in = models.TimeField(blank=True, null=True)
    time_out = models.TimeField(blank=True, null=True)
    REMARKS_CHOICES = [
        ("On time", "On time"),
        ("Late", "Late"),
        ("Absent", "Absent")
    ]
    remarks = models.CharField(max_length=20, choices=REMARKS_CHOICES)

    class Meta:
        unique_together = ["class_meeting", "student"]


class Campus_Attendance(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="campus_attendances")
    time_in = models.TimeField(blank=True, null=True)
    time_out = models.TimeField(blank=True, null=True)
    date = models.DateField()


class Faculty_Attendance(models.Model):
    faculty = models.ForeignKey(User, on_delete=models.CASCADE, related_name="faculty_attendances")
    time_in = models.TimeField(blank=True, null=True)
    time_out = models.TimeField(blank=True, null=True)
    date = models.DateField()
    REMARKS_CHOICES = [
        ("On time", "On time"),
        ("Late", "Late"),
        ("Absent", "Absent")
    ]
    remarks = models.CharField(max_length=20, choices=REMARKS_CHOICES)

    class Meta:
        unique_together = ["faculty", "date"]


class Event_Attendance(models.Model):
    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    student = models.ForeignKey(User, on_delete=models.CASCADE)
    time_in = models.TimeField(blank=True, null=True)
    time_out = models.TimeField(blank=True, null=True)
    REMARKS_CHOICES = [
        ("On time", "On time"),
        ("Late", "Late"),
        ("Absent", "Absent")
    ]
    remarks = models.CharField(max_length=20, choices=REMARKS_CHOICES)

    class Meta:
        unique_together = ["event", "student"]

