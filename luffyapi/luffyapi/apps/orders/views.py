from rest_framework.generics import CreateAPIView
from .models import Order, OrderDetail
from .serializers import OrderModelSerializer
from rest_framework.permissions import IsAuthenticated


class OrderCreateAPIView(CreateAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Order.objects.all()
    serializer_class = OrderModelSerializer