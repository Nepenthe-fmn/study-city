from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.


class User(AbstractUser):
    """自定义用户模型"""
    name = models.CharField(max_length=150, default=None, null=True, blank=True, verbose_name='用户昵称')
    avatar = models.ImageField(upload_to="avatar", null=True, blank=True, verbose_name="头像")
    mobile = models.CharField(max_length=20, unique=True, verbose_name="手机号")
    birthday = models.DateTimeField(null=True, blank=True, verbose_name="出生日期")
    money = models.DecimalField(max_digits=10, default=0.0, decimal_places=2, verbose_name="资金余额")
    class Meta:
        db_table = 'ly_users'
        verbose_name = '用户'
        verbose_name_plural = verbose_name





