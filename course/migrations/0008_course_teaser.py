# Generated by Django 3.2 on 2022-04-10 11:22

import common.yandex_storage
import course.models.course
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('course', '0007_participant_access'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='teaser',
            field=models.FileField(blank=True, null=True, storage=common.yandex_storage.ClientDocsStorage, upload_to=course.models.course.course_teaser_dir, verbose_name='Тизер'),
        ),
    ]
