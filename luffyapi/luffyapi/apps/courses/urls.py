from django.urls import re_path, path
from . import views
urlpatterns = [
    path("category/", views.CourseCategoryAPIView.as_view()),
    path("", views.CourseAPIView.as_view()),
    re_path(r"^(?P<pk>\d+)/$", views.CourseRetrieveAPIView.as_view()),
    path("chapters/", views.CourseChapterListAPIView.as_view()),
    path("play/", views.PolyvAPIView.as_view()),
    path("chapters2/", views.MyCourseChapterListAPIView.as_view()),
]






