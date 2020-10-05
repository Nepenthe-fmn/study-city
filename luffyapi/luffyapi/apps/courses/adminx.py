import xadmin
from .models import CourseCategory, Teacher, Course, \
    CourseChapter, CourseLesson, CourseExpire, ActivityDiscount, \
    Activity, CourseDiscount, CourseDiscountType
from xadmin.layout import Fieldset


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


class CourseExpireModelAdmin(object):
    """ 课程与有效期模型管理 """
    list_display = ["course", "name", "time", "price"]


class CourseDiscountTypeModelAdmin(object):
    """课程优惠类型"""
    list_display = ["id", "name", "remark"]


class CourseDiscountModelAdmin(object):
    """课程价格优惠"""
    list_display = ["id", "name", "discount_type", "condition", "sale"]


class ActivityModelAdmin(object):
    """优惠活动记录"""
    list_display = ["id", "name", "start_time", "end_time"]


class ActivityDiscountModelAdmin(object):
    """优惠活动记录"""
    list_display = ["id", "activity", "course", "discount"]
    form_layout = (
        Fieldset("必填项", 'activity', 'course', 'discount'),
        Fieldset("可选项", 'orders', 'is_show', 'is_delete'),
        Fieldset(None, 'name', **{"style": "display:none;"}),
    )


xadmin.site.register(CourseCategory, CourseCategoryModelAdmin)
xadmin.site.register(Course, CourseModelAdmin)
xadmin.site.register(Teacher, TeacherModelAdmin)
xadmin.site.register(CourseChapter, CourseChapterModelAdmin)
xadmin.site.register(CourseLesson, CourseLessonModelAdmin)
xadmin.site.register(CourseExpire, CourseExpireModelAdmin)
xadmin.site.register(CourseDiscountType, CourseDiscountTypeModelAdmin)
xadmin.site.register(CourseDiscount, CourseDiscountModelAdmin)
xadmin.site.register(Activity, ActivityModelAdmin)
xadmin.site.register(ActivityDiscount, ActivityDiscountModelAdmin)






