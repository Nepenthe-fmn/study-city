from django.urls import path
from . import views

urlpatterns = [
    path("course/", views.CartViewSet.as_view({
        "post": "add_cart",
        "get": "list_cart",
        "put": "change_status",
        "delete": "del_cart",
    })),
]







