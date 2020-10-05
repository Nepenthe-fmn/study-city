# Generated by Django 2.2 on 2020-09-28 13:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CourseExpire',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('orders', models.IntegerField(default=0, verbose_name='显示顺序')),
                ('is_show', models.BooleanField(default=False, verbose_name='是否上架')),
                ('is_delete', models.BooleanField(default=False, verbose_name='逻辑删除')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('updateed_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('name', models.CharField(blank=True, default=None, help_text='例如: 1个月有效', max_length=150, null=True, verbose_name='课程有效期(天)')),
                ('time', models.IntegerField(help_text='例如: 30', verbose_name='课程有效期(天)')),
                ('price', models.DecimalField(decimal_places=2, default=0, max_digits=8, verbose_name='课程价格')),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='course2expire', to='courses.Course', verbose_name='课程ID')),
            ],
            options={
                'verbose_name': '课程与有效期',
                'verbose_name_plural': '课程与有效期',
                'db_table': 'ly_course_expire',
            },
        ),
    ]
