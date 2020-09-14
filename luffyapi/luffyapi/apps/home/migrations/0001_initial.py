# Generated by Django 2.2 on 2020-09-14 17:55

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Banner',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, default=None, max_length=150, null=True, verbose_name='名称/标题')),
                ('orders', models.IntegerField(default=0, verbose_name='显示顺序')),
                ('is_show', models.BooleanField(default=False, verbose_name='是否上架')),
                ('is_delete', models.BooleanField(default=False, verbose_name='逻辑删除')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updateed_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('image', models.ImageField(blank=True, null=True, upload_to='banner', verbose_name='轮播图')),
                ('note', models.CharField(max_length=150, verbose_name='备注信息')),
                ('link', models.CharField(max_length=150, verbose_name='轮播图广告地址')),
            ],
            options={
                'verbose_name': '轮播图',
                'verbose_name_plural': '轮播图',
                'db_table': 'ly_banner',
            },
        ),
        migrations.CreateModel(
            name='Nav',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, default=None, max_length=150, null=True, verbose_name='名称/标题')),
                ('orders', models.IntegerField(default=0, verbose_name='显示顺序')),
                ('is_show', models.BooleanField(default=False, verbose_name='是否上架')),
                ('is_delete', models.BooleanField(default=False, verbose_name='逻辑删除')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updateed_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('link', models.CharField(help_text='如果是站外导航,则需要写上完整链接地址,例如:http://www.luffycity.cn<br>如果是站内地址,则可以直接写上路径不需要加上协议域名,例如: /courses', max_length=250, verbose_name='导航地址')),
                ('opt', models.SmallIntegerField(choices=[(0, '头部导航'), (1, '脚部导航')], default=0, verbose_name='导航位置')),
                ('is_http', models.BooleanField(default=False, verbose_name='是否属于站外链接')),
            ],
            options={
                'verbose_name': '导航',
                'verbose_name_plural': '导航',
                'db_table': 'ly_nav',
            },
        ),
    ]
