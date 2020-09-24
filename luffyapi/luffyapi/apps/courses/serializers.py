from rest_framework import serializers
from .models import CourseCategory, Course, Teacher


class CourseCategorySerializer(serializers.ModelSerializer):
    """ 课程分类列 """
    class Meta:
        model = CourseCategory
        fields = ['id', "name"]


class TeacherSerializer(serializers.ModelSerializer):
    """ 教师表"""
    class Meta:
        model = Teacher
        fields = ["id", "name", "role", "title", "signature"]


class CourseSerializer(serializers.ModelSerializer):
    """ 课程详情 """
    teacher = TeacherSerializer()

    class Meta:
        model = Course
        fields = ["id", "name", "course_img", "students",
                  "lessons", "pub_lessons", "price",
                  "teacher", "recomment_lesson_list"]


