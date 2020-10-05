# from django.db import models
# from luffyapi.utils.models import BaseModel
# from ckeditor_uploader.fields import RichTextUploadingField
# from courses.models import Teacher
# # from django.utils import timezone as datetime
#
#
# class Course(BaseModel):
#     """
#     实战课程
#     """
#     course_type = (
#         (0, '付费'),
#         (1, 'VIP专享'),
#         (2, '学位课程'),
#     )
#     level_choices = (
#         (0, '初级'),
#         (1, '中级'),
#         (2, '高级'),
#     )
#     status_choices = (
#         (0, '上线'),
#         (1, '下线'),
#         (2, '预上线'),
#     )
#     course_img = models.ImageField(upload_to="course", max_length=255, verbose_name="封面图片", blank=True, null=True)
#     course_video = models.FileField(upload_to="course_video", max_length=255, verbose_name="封面视频", blank=True, null=True)
#     course_type = models.SmallIntegerField(choices=course_type, default=0, verbose_name="付费类型")
#     #
#     brief = RichTextUploadingField(verbose_name="详情介绍", null=True, blank=True)
#     level = models.SmallIntegerField(choices=level_choices, default=1, verbose_name="难度等级")
#     pub_date = models.DateField(verbose_name="发布日期", auto_now_add=True)
#     period = models.IntegerField(verbose_name="建议学习周期(day)", default=7)
#     attachment_path = models.FileField(max_length=128, verbose_name="课件路径", blank=True, null=True)
#     status = models.SmallIntegerField(choices=status_choices, default=0, verbose_name="课程状态")
#     course_category = models.ForeignKey("CourseCategory", on_delete=models.DO_NOTHING, null=True, blank=True, verbose_name="课程分类")
#     students = models.IntegerField(verbose_name="学习人数", default=0)
#     lessons = models.IntegerField(verbose_name="总课时数量", default=0)
#     pub_lessons = models.IntegerField(verbose_name="课时更新数量", default=0)
#     price = models.DecimalField(max_digits=6, decimal_places=2, verbose_name="课程原价", help_text="此处填写价格属于永久购买价格,如果没有<b style='color: red;'>永久购买</b>期限,则默认价格为0,请不要随意删除", default=0)
#     teacher = models.ForeignKey(Teacher, on_delete=models.DO_NOTHING, null=True, blank=True, verbose_name="授课老师")
#
#     class Meta:
#         db_table = "ly_course"
#         verbose_name = "实战课程"
#         verbose_name_plural = "实战课程"
