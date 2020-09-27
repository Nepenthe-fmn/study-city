from django.db import models
from luffyapi.utils.models import BaseModel
from luffyapi.settings import constants
from ckeditor_uploader.fields import RichTextUploadingField
# Create your models here.


class CourseCategory(BaseModel):
    """
    课程分类
    """
    class Meta:
        db_table = "ly_course_category"
        verbose_name = "课程分类"
        verbose_name_plural = "课程分类"


class Course(BaseModel):
    """
    实战课程
    """
    course_type = (
        (0, '付费'),
        (1, 'VIP专享'),
        (2, '学位课程'),
    )
    level_choices = (
        (0, '初级'),
        (1, '中级'),
        (2, '高级'),
    )
    status_choices = (
        (0, '上线'),
        (1, '下线'),
        (2, '预上线'),
    )
    course_img = models.ImageField(upload_to="course", max_length=255, verbose_name="封面图片", blank=True, null=True)
    course_video = models.FileField(upload_to="course_video", max_length=255, verbose_name="封面视频", blank=True, null=True)
    course_type = models.SmallIntegerField(choices=course_type, default=0, verbose_name="付费类型")
    #
    brief = RichTextUploadingField(verbose_name="详情介绍", null=True, blank=True)
    level = models.SmallIntegerField(choices=level_choices, default=1, verbose_name="难度等级")
    pub_date = models.DateField(verbose_name="发布日期", auto_now_add=True)
    period = models.IntegerField(verbose_name="建议学习周期(day)", default=7)
    attachment_path = models.FileField(max_length=128, verbose_name="课件路径", blank=True, null=True)
    status = models.SmallIntegerField(choices=status_choices, default=0, verbose_name="课程状态")
    course_category = models.ForeignKey("CourseCategory", on_delete=models.DO_NOTHING, null=True, blank=True, verbose_name="课程分类")
    students = models.IntegerField(verbose_name="学习人数", default=0)
    lessons = models.IntegerField(verbose_name="总课时数量", default=0)
    pub_lessons = models.IntegerField(verbose_name="课时更新数量", default=0)
    price = models.DecimalField(max_digits=6, decimal_places=2, verbose_name="课程原价", default=0)
    teacher = models.ForeignKey("Teacher", on_delete=models.DO_NOTHING, null=True, blank=True, verbose_name="授课老师")

    class Meta:
        db_table = "ly_course"
        verbose_name = "实战课程"
        verbose_name_plural = "实战课程"

    @property
    def recomment_lesson_list(self):
        lesson_list = self.lesson_list.filter(is_delete=False,is_show=True,recomment=True).order_by("-orders").all()[:constants.RECOMMEND_LESSON_SIZE]
        data_list = [{
            "id": lesson.id, "name": lesson.name,
            "free_trail": lesson.free_trail,
            "number": lesson.number} for lesson in lesson_list]
        return data_list

    @property
    def level_name(self):
        return self.get_level_display()


class Teacher(BaseModel):
    """讲师、导师表"""
    role_choices = (
        (0, '讲师'),
        (1, '导师'),
        (2, '班主任'),
    )
    role = models.SmallIntegerField(choices=role_choices, default=0, verbose_name="讲师身份")
    title = models.CharField(max_length=64, verbose_name="职位、职称")
    signature = models.CharField(max_length=255, verbose_name="导师标签签名", help_text="导师标签签名", blank=True, null=True)
    image = models.ImageField(upload_to="teacher", null=True, verbose_name = "讲师封面")
    brief = models.TextField(max_length=1024, verbose_name="讲师描述")

    class Meta:
        db_table = "ly_teacher"
        verbose_name = "讲师导师"
        verbose_name_plural = "讲师导师"


class CourseChapter(BaseModel):
    """课程章节"""
    course = models.ForeignKey("Course", related_name='chapters', on_delete=models.CASCADE, verbose_name="课程名称")
    number = models.SmallIntegerField(verbose_name="章节序号", default=1)
    summary = models.TextField(verbose_name="章节介绍", blank=True, null=True)
    pub_date = models.DateField(verbose_name="发布日期", auto_now_add=True)

    class Meta:
        db_table = "ly_course_chapter"
        verbose_name = "课程章节"
        verbose_name_plural = "课程章节"

    def __str__(self):
        return "课程:%s-第%s章-%s" % (self.course, self.number, self.name)

    @property
    def lesson_list(self):
        lesson_list = self.lessons.filter(is_delete=False, is_show=True).order_by("number").all()
        data_list = [{
            "id": lesson.id,
            "name": lesson.name,
            "free_trail": lesson.free_trail,
            "number": lesson.number,
            "duration": lesson.duration
        } for lesson in lesson_list]

        return data_list


class CourseLesson(BaseModel):
    """课程课时"""
    lesson_type_choices = (
        (0, '文档'),
        (1, '练习'),
        (2, '视频')
    )
    chapter = models.ForeignKey("CourseChapter", related_name='lessons', on_delete=models.CASCADE, verbose_name="章节")
    course = models.ForeignKey("Course", related_name="lesson_list", on_delete=models.CASCADE, verbose_name="课程")
    lesson_type = models.SmallIntegerField(default=2, choices=lesson_type_choices, verbose_name="课时种类")
    lesson_link = models.CharField(max_length=255, blank=True, null=True, verbose_name="课时链接",
                                   help_text="若是video，填vid,若是文档，填link")
    duration = models.CharField(verbose_name="视频时长", blank=True, null=True, max_length=32)  # 仅在前端展示使用
    pub_date = models.DateTimeField(verbose_name="发布时间", auto_now_add=True)
    free_trail = models.BooleanField(verbose_name="是否可试看", default=False)
    recomment = models.BooleanField(verbose_name="是否推荐到课程列表")
    number = models.IntegerField(default=1, verbose_name="课时序号")

    class Meta:
        db_table = "ly_course_lesson"
        verbose_name = "课程课时"
        verbose_name_plural = "课程课时"

    def __str__(self):
        return "%s-第%s节-%s" % (self.chapter, self.number,self.name)














