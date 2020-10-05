from rest_framework import serializers
from .models import CourseCategory, Course, Teacher, CourseChapter


class CourseCategorySerializer(serializers.ModelSerializer):
    """ 课程分类列 """
    class Meta:
        model = CourseCategory
        fields = ['id', "name"]


class TeacherSerializer(serializers.ModelSerializer):
    """ 教师表"""
    class Meta:
        model = Teacher
        fields = ["id", "name", "role", "title", "signature", 'image', 'brief']


class CourseSerializer(serializers.ModelSerializer):
    """ 课程列表 """
    teacher = TeacherSerializer()

    class Meta:
        model = Course
        # fields = ["id", "name", "course_img", "students",
        #           "lessons", "pub_lessons", "price",
        #           "teacher", "recomment_lesson_list"]
        fields = ["id", "name", "course_img", "students", "discount_name",
                  "discount_price", "lessons", "pub_lessons",
                  "min_price", "teacher", "recomment_lesson_list"]


class CourseRetrieveSerializer(serializers.ModelSerializer):
    """ 课程详情 """
    teacher = TeacherSerializer()

    class Meta:
        model = Course
        fields = ["id", "name", "course_img", "course_video", "students",
                  "lessons", "pub_lessons", "min_price", "teacher", "brief",
                  "level_name", "pub_date", "discount_name", "discount_price",
                  "activity_end_time"]


class CourseCategoryModelSerializer(serializers.ModelSerializer):
    """ 课程详情 """
    class Meta:
        model = CourseChapter
        fields = ['id', 'number', 'name', 'summary', 'lesson_list']








