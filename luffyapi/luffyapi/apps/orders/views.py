from rest_framework.generics import CreateAPIView
from .models import Order, OrderDetail
from .serializers import OrderModelSerializer, OrderListModelSerializer
from rest_framework.permissions import IsAuthenticated
from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status


class OrderCreateAPIView(CreateAPIView):
    """ 创建订单 """
    permission_classes = [IsAuthenticated]
    queryset = Order.objects.all()
    serializer_class = OrderModelSerializer


class OrderListAPIView(ListAPIView):
    """ 个人中心的订单列表 """
    permission_classes = [IsAuthenticated]
    serializer_class = OrderListModelSerializer
    queryset = Order.objects.all()

    def get_queryset(self):
        return Order.objects.filter(user=self.request.user).all()

    # def list(self, request, **kwargs):
    #     print("request.user.id:", type(request.user.id), request.user.id)
    #     print("request.query_params:", type(request.query_params), request.query_params)
    #     if request.user.id != request.query_params.user_id:  # 这个需要前端传输用户数据回来给后端进行判断处理
    #         return Response({"message": "对不起，您无法查看其他用户的订单信息"}, status=status.HTTP_403_FORBIDDEN)
    #     return super().list(request, **kwargs)


class OrderCancelAPIView(APIView):
    permission_classes = [IsAuthenticated]

    def patch(self, request):
        """取消订单"""
        order_number = request.data.get("order_number")
        try:
            order = Order.objects.get(order_status=0, user=request.user, order_number=order_number)
        except Order.DoesNotExist:
            return Response({"message": "对不起，订单不存在！"}, status=status.HTTP_400_BAD_REQUEST)

        order.order_status = 2
        order.save()
        return Response({"message": "取消订单成功！"})




