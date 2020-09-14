from rest_framework.generics import ListAPIView
from .models import Banner
from .serializers import BannerModelSerializer
from luffyapi.settings import constants
# Create your views here.


class BannerListAPIView(ListAPIView):
    queryset = Banner.objects.filter(is_show=True, is_delete=False).order_by("-orders", "-id")[
               :constants.HOME_BANNER_LENGTH]
    serializer_class = BannerModelSerializer

