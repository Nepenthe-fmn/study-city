from django.contrib.auth.backends import ModelBackend, UserModel
from django.db.models import Q


class AuthModelBackend(ModelBackend):
    """ 自定义认证类 """
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserModel.objects.get(Q(username=username) | Q(mobile=username))
            if user.check_password(password) and self.user_can_authenticate(user):
                return user
        except UserModel.DoesNotExist:
            return None


def jwt_response_payload_handler(token, user=None, request=None):
    """
    jwt自定义响应数据
    :param token: jwt token
    :param user: 用户模型对象
    :param request: 本次客户端的请求对象
    :return: 字典, 返回值
    """
    return {
        'token': token,
        'user_id': user.id,
        'avatar': user.avatar.url if user.avatar else "",
        'nickname': user.name if user.name else ""
    }



