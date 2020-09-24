from rest_framework.generics import ListAPIView
from .models import CourseCategory
from .serializers import CourseCategorySerializer
from .models import Course
from .serializers import CourseSerializer


# Create your views here.
class CourseCategoryAPIView(ListAPIView):
    """ 课程分类列表 """
    queryset = CourseCategory.objects.filter(is_delete=False, is_show=True).order_by("orders")
    serializer_class = CourseCategorySerializer


class CourseAPIView(ListAPIView):
    """课程列表接口"""
    queryset = Course.objects.filter(is_delete=False, is_show=True).order_by("-orders")
    serializer_class = CourseSerializer





