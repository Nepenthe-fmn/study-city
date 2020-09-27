from django.shortcuts import render
from rest_framework.viewsets import ViewSet
from courses.models import Course
from rest_framework.response import Response
from rest_framework import status
from django_redis import get_redis_connection
from rest_framework.permissions import IsAuthenticated
# Create your views here.


class CartViewSet(ViewSet):
    permission_classes = [IsAuthenticated, ]  # 用户身份认证识别

    def add_cart(self, request):
        """ 添加商品购物车 """
        # 接收数据
        user = request.user
        course_id = request.data.get("course_id")
        try:
            course = Course.objects.get(pk=course_id)
        except Course.DoesNotExist:
            return Response({"message": "商品不存在!"}, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response({"message": "未知异常"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        expire = 0     # 购买周期，0表示没有设置购买周期
        select = True  # 商品勾选状态

        # 2.保存数据到redis中
        redis = get_redis_connection("cart")
        pipe = redis.pipeline()
        pipe.multi()
        pipe.hset("cart_%s" % user.id, course_id, expire)
        pipe.sadd("select_%s" % user.id, course_id)
        pipe.execute()

        # 3.返回相应结果
        course = redis.hlen("cart_%s" % user.id)
        return Response({"message": "添加商品成功！", "count": course})














