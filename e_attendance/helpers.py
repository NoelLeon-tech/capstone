from .models import Course, Strand


def get_school_years(classes=None, class_students=None):
    if classes:
        return classes.values_list("school_year", flat=True).distinct()
    else:
        return class_students.values_list("cls__school_year", flat=True).distinct()


def get_semesters(classes=None, class_students=None):
    if classes:
        return classes.values_list("semester", flat=True).distinct()
    else:
        return class_students.values_list("cls__semester", flat=True).distinct()


def get_courses(classes=None, class_students=None):
    if classes:
        course_ids = set(classes.values_list("course_id", flat=True).distinct())
    else:
        course_ids = set(class_students.values_list("cls__course_id", flat=True).distinct())
        
    while None in course_ids:
        course_ids.discard(None)
    return [Course.objects.get(pk=course_id) for course_id in course_ids]


def get_strands(classes=None, class_students=None):
    if classes:
        strand_ids = set(classes.values_list("strand_id", flat=True).distinct())
    else:
        strand_ids = set(class_students.values_list("cls__strand_id", flat=True).distinct())
        
    while None in strand_ids:
        strand_ids.discard(None)
    return [Strand.objects.get(pk=strand_id) for strand_id in strand_ids]


def filter_classes(classes=None, class_students=None, school_year=None, semester=None, course_id=None, strand_id=None):
    if classes:
        if school_year:
            classes = classes.filter(school_year=school_year)
        if semester:
            classes = classes.filter(semester=semester)
        if course_id:
            classes = classes.filter(course_id=course_id)
        if strand_id:
            classes = classes.filter(strand_id=strand_id)
        return classes
    else:
        if school_year:
            class_students = class_students.filter(cls__school_year=school_year)
        if semester:
            class_students = class_students.filter(cls__semester=semester)
        if course_id:
            class_students = class_students.filter(cls__course_id=course_id)
        if strand_id:
            class_students = class_students.filter(cls__strand_id=strand_id)
        return class_students
