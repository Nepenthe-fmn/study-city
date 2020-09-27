import os,django
# 1 主程序
from celery import Celery

# 2　创建celery实例
app = Celery("luffy")

# 3 初始化django对象
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'luffyapi.settings.dev')
django.setup()

# 加载配置
app.config_from_object("mycelery.config")

# 4 自动搜索并加载任务
# 注：参数必须是一个列表，里面的每一个任务都是任务的路径名称
app.autodiscover_tasks(["mycelery.sms"])








