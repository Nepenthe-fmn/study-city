from rest_framework import serializers
from .models import Order, OrderDetail
from django.utils import timezone as datetime
import random
from django_redis import get_redis_connection
from courses.models import Course


class OrderModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ["pay_type", "credit", "coupon", "total_price","real_price","order_number"]
        read_only_fields = ["total_price","real_price","order_number"]

    def validate(self, attrs):
        """验证客户端发送过来的数据"""
        pay_type = int(attrs["pay_type"])
        is_check = False
        for choices in Order.pay_choices:
            if choices[0] == pay_type:
                is_check = True
        if is_check is False:
            raise serializers.ValidationError("支付方式不存在!")

        # todo 积分数量

        # todo 优惠券,是否存在,是否过期,是否符合使用条件

        return attrs

    def create(self, validated_data):
        """生成订单"""
        pay_type = validated_data.get("pay_type")
        user = self.context["request"].user
        order_number = datetime.now().strftime("%Y%m%d%H%I%S")+("%010d" % user.id)+str(random.randint(0,99999999))
        order_total_price = 0
        order_real_price = 0
        order = Order.objects.create(
            name="课程购买",
            user=user,
            total_price=order_total_price,
            real_price=order_real_price,
            order_number=order_number,
            order_status=0,
            pay_type=pay_type,
            credit=0,
            coupon=0,
            order_desc="课程购买",
        )

        # 从购物车中查询所有勾选的商品信息
        redis = get_redis_connection("cart")

        dict_cart_bytes = redis.hgetall("cart_%s" % user.id)
        set_select_bytes = redis.smembers("select_%s" % user.id)

        data = []
        for course_id_bytes, expire_bytes in dict_cart_bytes.items():
            # 如果当前商品不是集合中勾选的商品信息,则直接跳过本轮循环
            if course_id_bytes not in set_select_bytes:
                continue

            expire = expire_bytes.decode()
            course_id = course_id_bytes.decode()
            try:
                course = Course.objects.get(pk=course_id)
            except Course.DoesNotExist:
                """商品没有了...."""
                continue

            # 在循环中把商品的其他信息添加到商品里面
            price = float(course.get_price(expire))
            discount_price = float(course.discount_price(price))
            detail = OrderDetail.objects.create(
                order=order,
                course=course,
                expire=expire,
                expire_text=course.expire_text(expire),
                price=price,
                real_price=discount_price,
                discount_name=course.discount_name
            )

            detail.save()

            order_total_price += price
            order_total_price += discount_price

        order.total_price = order_total_price
        order.real_price = order_total_price
        order.save()

        return order