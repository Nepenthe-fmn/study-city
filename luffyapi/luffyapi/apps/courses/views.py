from rest_framework.generics import ListAPIView, RetrieveAPIView
from .models import CourseCategory, CourseChapter
from .serializers import CourseSerializer, CourseCategorySerializer, Course, CourseRetrieveSerializer, CourseCategoryModelSerializer
from django_filters.rest_framework import DjangoFilterBackend
from .paginations import CoursePagination
from rest_framework.filters import OrderingFilter


# Create your views here.
class CourseCategoryAPIView(ListAPIView):
    """ 课程分类列表 """
    queryset = CourseCategory.objects.filter(is_delete=False, is_show=True).order_by("orders")
    serializer_class = CourseCategorySerializer


class CourseAPIView(ListAPIView):
    """ 课程列表接口 """
    filter_backends = [DjangoFilterBackend, OrderingFilter]
    filter_fields = ('course_category', )
    ordering_fileds = ["id", "price", "students"]
    pagination_class = CoursePagination
    queryset = Course.objects.filter(is_delete=False, is_show=True).order_by("-orders")
    serializer_class = CourseSerializer


class CourseRetrieveAPIView(RetrieveAPIView):
    """ 课程详情 """
    queryset = Course.objects.filter(is_delete=False, is_show=True)
    serializer_class = CourseRetrieveSerializer


class CourseChapterListAPIView(ListAPIView):
    """ 章节/课时 """
    queryset = CourseChapter.objects.filter(is_show=True, is_delete=False).order_by("number")
    serializer_class = CourseCategoryModelSerializer
    filter_backends = [DjangoFilterBackend, ]
    filter_fields = ['course', ]








