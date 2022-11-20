select e_attendance_subject.name, instructor.first_name, student.first_name 
from e_attendance_class_student
join e_attendance_class on e_attendance_class.id = e_attendance_class_student._class_id
join e_attendance_user as student on e_attendance_user.id = e_attendance_class_student.student_id
join e_attendance_subject on e_attendance_subject.id = e_attendance_class.subject_id
join e_attendance_user as instructor on e_attendance_user.id = e_attendance_class.instructor_id;