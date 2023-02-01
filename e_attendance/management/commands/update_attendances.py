from django.core.management.base import BaseCommand, CommandError
from ...models import *
from datetime import datetime, timedelta

class Command(BaseCommand):

    def handle(self, *args, **options):
        now = datetime.now()

        # Update class attendances.

        # Loop through each class meetings.
        for class_meeting in Class_Meeting.objects.all():
            if now.time() > class_meeting.end_time:
                # For each class_meeting, check if each student of the class has
                # attendance record for the class_meeting.
                for class_student in Class_Student.objects.filter(cls=class_meeting.cls):
                    student_id = class_student.student_id
                    try:
                        class_attendance = Class_Attendance.objects.get(class_meeting=class_meeting, student_id=student_id)
                        if not class_attendance.time_out:
                            class_attendance.remarks = "Absent"
                            class_attendance.save()

                    except Class_Attendance.DoesNotExist:                    
                        Class_Attendance.objects.create(
                            class_meeting=class_meeting,
                            student_id=student_id,
                            remarks = "Absent"
                        )

        # Update faculty attendances
        for faculty in User.objects.filter(groups__name="faculty"):
            try:
                faculty_attendance = Faculty_Attendance.objects.get(faculty=faculty, date=now.date())
                if not faculty_attendance.time_out:
                    faculty_attendance.remarks = "Absent"
                    faculty_attendance.save()
            except Faculty_Attendance.DoesNotExist:
                Faculty_Attendance.objects.create(
                    faculty=faculty,
                    date=now.date(),
                    remarks="Absent"
                )
        


