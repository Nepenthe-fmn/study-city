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

    def list_cart(self, request):
        """ 购物车商品列表 """
        user = request.user
        # 1. 从redis中取出所有商品信息
        redis = get_redis_connection("cart")
        dict_cart_bytes = redis.hgetall("cart_%s" % user.id)
        set_select_bytes = redis.smembers("select_%s" % user.id)

        # 2. 重组数据结构，循环redis中的hash数据，创建一个商品列表
        data = []
        for course_id_bytes, expire_bytes in dict_cart_bytes.items():
            expire = expire_bytes.decode()
            course_id = course_id_bytes.decode()
            try:
                course = Course.objects.get(pk=course_id)
            except:
                """ 商品不存在就此此循环 """
                continue
            # 2.1 循环中把商品的其他信息添加到商品里面
            data.append({
                "course_id": course.id,
                "course_name": course.name,
                "course_img": course.course_img.url,
                "price": course.get_price,
                "expire": int(expire),
                "select": True if course_id_bytes in set_select_bytes else False
            })

        # 3. 返回购物车中的商品列表、
        return Response(data)

    def change_status(self, request):
        """ 切换商品勾选状态 """
        # 1. 接收参数
        user = request.user
        course_id = request.data.get("course_id")
        select = request.data.get("select")
        print("1", user, course_id, select)
        # 2. 修改对应的勾选状态
        redis = get_redis_connection("cart")
        if select:
            print(1)
            redis.sadd("select_%s" % user.id, course_id)
        else:
            print(2)
            redis.srem("select_%s" % user.id, course_id)

        # 3. 返回响应结果
        return Response({"message": "切换状态成功！"})

    def del_cart(self, request):
        """ 从购物车中移除商品 """
        user = request.user
        course_id = request.query_params.get("course_id")

        redis = get_redis_connection("cart")
        pipe = redis.pipeline()
        pipe.multi()  # 开启事务
        pipe.hdel("cart_%s" % user.id, course_id)
        pipe.srem("select_%s" % user.id, course_id)
        pipe.execute()

        return Response({"message": "从购物车中移除商品成功"})



