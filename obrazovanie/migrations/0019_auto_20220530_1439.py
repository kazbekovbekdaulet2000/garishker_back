# Generated by Django 3.2 on 2022-05-30 08:39

import django.contrib.postgres.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('obrazovanie', '0018_video_languages'),
    ]

    operations = [
        migrations.AddField(
            model_name='report',
            name='tags',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.CharField(max_length=255), default=[], size=None),
        ),
        migrations.AddField(
            model_name='video',
            name='tags',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.CharField(max_length=255), default=[], size=None),
        ),
    ]