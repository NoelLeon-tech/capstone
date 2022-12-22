select 
	a.`date`,
    a.time_in,
    sched.start_time,
    sched.end_time,
    sched.`day`,
    subj.`name` as `subject`,
    i_user.first_name as `instructor fname`,
    i_user.last_name as `instructor lname`,
    stud_user.first_name as `student fname`, 
    stud_user.last_name as `student lname`,
    remarks
from e_attendance_attendance a

# get the class
join e_attendance_class c on c.id = a.class_id
# get the subject in the class
join e_attendance_subject subj on subj.id = c.subject_id
# get the instructor in the class
join e_attendance_instructor i on i.user_id = c.instructor_id
# get the instructor personal data
join e_attendance_user i_user on i_user.id = i.user_id

# get the student
join e_attendance_student stud on stud.user_id = a.student_id
# get the student personal data
join e_attendance_user stud_user on stud.user_id = stud_user.id

# get schedule
join e_attendance_class_schedule sched on sched.id = a.class_schedule_id;


