from .models import Course, Strand
import datetime


def get_school_years(classes=None, class_students=None):
    if classes:
        # SELECT DISTINCT school_year from classes
        return sorted(classes.values_list("school_year", flat=True).distinct()) 
    elif class_students:
        return sorted(class_students.values_list("cls__school_year", flat=True).distinct())


def get_semesters(classes=None, class_students=None):
    if classes:
        # SELECT DISTINCT semester from classes
        return sorted(classes.values_list("semester", flat=True).distinct())
    elif class_students:
        return sorted(class_students.values_list("cls__semester", flat=True).distinct())


def get_courses(classes):
    # SELECT DISTINCT course_id from classes
    course_ids = classes.values_list("course_id", flat=True).distinct() 
    # elif class_students:
    #     course_ids = set(class_students.values_list("cls__course_id", flat=True).distinct())
    
    courses = []
    for course_id in course_ids:
        if course_id:
            courses.append(Course.objects.get(pk=course_id))
    return courses


def get_strands(classes=None, class_students=None):   
    strand_ids = set()
    if classes:
        # SELECT DISTINCT strand_id from classes
        strand_ids = set(classes.values_list("strand_id", flat=True).distinct())
    elif class_students:
        strand_ids = set(class_students.values_list("cls__strand_id", flat=True).distinct())
        
    while None in strand_ids:
        strand_ids.discard(None)
    return [Strand.objects.get(pk=strand_id) for strand_id in strand_ids]

# =====================================FILTERING PROCESS============================================
def filter_classes(classes=None, class_students=None, school_year=None, semester=None, course_id=None, strand_id=None):
    if classes is not None:
        if school_year:
            classes = classes.filter(school_year=school_year)
        if semester:
            classes = classes.filter(semester=semester)
        if course_id:
            classes = classes.filter(course_id=course_id)
        if strand_id:
            classes = classes.filter(strand_id=strand_id)
        return classes
    elif class_students is not None:
        if school_year:
            class_students = class_students.filter(cls__school_year=school_year)
        if semester:
            class_students = class_students.filter(cls__semester=semester)
        if course_id:
            class_students = class_students.filter(cls__course_id=course_id)
        if strand_id:
            class_students = class_students.filter(cls__strand_id=strand_id)
        return class_students


# For calculating if attendance is on time or late.
# It will output the time difference in minutes.
def calculate_time_diff(time_in, start_time):
    date = datetime.date(1, 1, 1)
    time_diff = datetime.datetime.combine(date, time_in) - datetime.datetime.combine(date, start_time)
    time_diff_in_minutes = int(time_diff.total_seconds() / 60)
    return time_diff_in_minutes


# def calculate_time_diff(time_in, start_time):
#     time_diff = time_in - start_time
#     time_diff_in_minutes = int(time_diff.seconds / 60)
#     return time_diff_in_minutes    
    

def calculate_time_diff_hours(start_time, end_time):
    date = datetime.date(1, 1, 1)
    time_diff = datetime.datetime.combine(date, end_time) - datetime.datetime.combine(date, start_time)
    return time_diff.total_seconds() / 60**2


# def calculate_time_diff_hours(start_time, end_time):
#     time_diff = end_time - start_time
#     return time_diff.seconds/3600    
