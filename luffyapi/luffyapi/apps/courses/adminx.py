import xadmin
from .models import CourseCategory, Teacher, Course, CourseChapter, CourseLesson


class CourseCategoryModelAdmin(object):
    """ 课程分类管理 """
    pass


class CourseModelAdmin(object):
    """课程模型管理类"""
    pass


class TeacherModelAdmin(object):
    """老师模型管理类"""
    pass


class CourseChapterModelAdmin(object):
    """课程章节模型管理类"""
    pass


class CourseLessonModelAdmin(object):
    """课程课时模型管理类"""
    pass


xadmin.site.register(CourseCategory, CourseCategoryModelAdmin)
xadmin.site.register(Course, CourseModelAdmin)
xadmin.site.register(Teacher, TeacherModelAdmin)
xadmin.site.register(CourseChapter, CourseChapterModelAdmin)
xadmin.site.register(CourseLesson, CourseLessonModelAdmin)
