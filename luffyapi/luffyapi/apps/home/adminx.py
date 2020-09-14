import xadmin
from xadmin import views
from .models import Banner


class BaseSetting(object):
    """ xadmin的基本配置 """
    enable_themes = True  # 开启主题切换功能
    use_bootswatch = True


class GlobalSettings(object):
    """ xadmin的全局配置 """
    site_title = "路飞学城"  # 设置站点标题
    site_footer = "路飞学城有限公司"  # 设置站点的页脚
    menu_style = "accordion"  # 设置菜单折叠


class BannerModelAdmin(object):
    list_display=["name","orders","is_show"]


xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)
xadmin.site.register(Banner, BannerModelAdmin)


