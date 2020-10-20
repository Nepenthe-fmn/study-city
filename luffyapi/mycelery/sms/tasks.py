# celery的任务必须写在task.py中
import json,logging
from mycelery.main import app
from django.conf import settings
from celery.app.task import Task
from luffyapi.utils import sms
log = logging.getLogger("django")


# 异步任务监听
class SMSTask(Task):
    def on_success(self, retval, task_id, args, kwargs):
        print('Success!')
        return super().on_success(retval, task_id, args, kwargs)

    def on_failure(self, exc, task_id, args, kwargs, einfo):
        print('Fail!')
        return super().on_failure(exc, task_id, args, kwargs, einfo)

    def after_return(self, status, retval, task_id, args, kwargs, einfo):
        print('this is after return')
        return super().after_return(status, retval, task_id, args, kwargs, einfo)

    def on_retry(self, exc, task_id, args, kwargs, einfo):
        print('this is retry')
        return super().on_retry(exc, task_id, args, kwargs, einfo)


@app.task(name="send_sms", base=SMSTask)
def send_sms(mobile, template_code):
    """ 发送短信 """
    # print("Send！")
    try:
        ret = sms.send_sms(template_code, mobile, settings.SMS_TEMPLATE_ID["register"])
        ret = json.loads(ret)
        if ret.get("Message") != 'OK' or ret.get('Code') != 'OK':
            raise Exception
    except Exception as exc:
        log.error("短信发送失败! 手机号:%s: %s" % (mobile, exc))
        raise Exception













