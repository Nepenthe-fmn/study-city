from rest_framework.generics import ListAPIView
from .models import Banner
from .serializers import BannerModelSerializer
from luffyapi.settings import constants
from .models import Nav
from .serializers import NavModelSerializer

# Create your views here.


class BannerListAPIView(ListAPIView):
    # 轮播
    queryset = Banner.objects.filter(is_show=True, is_delete=False).order_by("-orders", "-id")[
               :constants.HOME_BANNER_LENGTH]
    serializer_class = BannerModelSerializer


class HeaderNavListAPIView(ListAPIView):
    # 页首title
    queryset = Nav.objects.filter(
        is_show=True,
        is_delete=False,
        opt=0,
    ).order_by("-orders", "-id")[:constants.HEADER_NAV_LENGTH]
    serializer_class = NavModelSerializer


class FooterNavListAPIView(ListAPIView):
    # 页脚链接
    queryset = Nav.objects.filter(
        is_show=True,
        is_delete=False,
        opt=1,
    ).order_by("-orders", "-id")[:constants.HEADER_NAV_LENGTH]
    serializer_class = NavModelSerializer



