import random
import json
from rest_framework_jwt.views import ObtainJSONWebToken
from .serializers import CurtomJSONWebTokenSerializer
from rest_framework.views import APIView
from rest_framework.generics import CreateAPIView
from django_redis import get_redis_connection
from rest_framework.response import Response
from django.conf import settings
from luffyapi.settings import constants
from luffyapi.utils import sms
from rest_framework import status
from rest_framework.throttling import ScopedRateThrottle
from users.models import User
from users.serializers import UserModelSerializer
from mycelery.sms.tasks import send_sms


# Create your views here.
class ObtainAPIView(ObtainJSONWebToken):
    serializer_class = CurtomJSONWebTokenSerializer


class SendSMSAPIView(APIView):
    """ 短信验证码发送 """
    throttle_classes = [ScopedRateThrottle]
    throttle_scope = "send_power"

    def get(self, request, mobile):
        """ 获取短信验证码 """
        # 判断是否处于发送短信冷却时间内
        redis = get_redis_connection("sms_code")
        interval_time = redis.ttl("interval_%s" % mobile)
        if interval_time >= 0:
            return Response({"message": "短信已发送，请%s秒后再点击发送" % interval_time})
        code = "%06d" % random.randint(0, 99999)
        template_code = {
            'code': code
        }
        # 记录短信验证码到redis数据库中
        ret = send_sms.delay(mobile, template_code)
        pipe = redis.pipeline(0)  # 创建一个管道对象
        pipe.multi()  # 开启事务
        pipe.setex("sms_%s" % mobile, constants.SMS_EXPIRE_TIME, code)
        pipe.setex("interval_%s" % mobile, constants.SMS_INTERVAL_TIME, "_")
        pipe.execute()  # 执行事物
        return Response({"message": "短信已发送，请留意您的短信"})


class UserAPIView(CreateAPIView):
    """用户管理"""
    queryset = User.objects.all()
    serializer_class = UserModelSerializer

