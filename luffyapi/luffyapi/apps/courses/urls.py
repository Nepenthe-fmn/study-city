from django.urls import re_path, path
from . import views
urlpatterns = [
    path("category/", views.CourseCategoryAPIView.as_view()),
    path("", views.CourseAPIView.as_view()),
]






