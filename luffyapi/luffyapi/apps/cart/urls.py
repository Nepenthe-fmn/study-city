from django.urls import path
from . import views

urlpatterns = [
    path("course/", views.CartViewSet.as_view({"post": "add_cart"})),
]







