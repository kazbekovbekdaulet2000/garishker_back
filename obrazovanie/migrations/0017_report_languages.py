# Generated by Django 3.2 on 2022-05-12 19:48

import django.contrib.postgres.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('obrazovanie', '0016_auto_20220508_2205'),
    ]

    operations = [
        migrations.AddField(
            model_name='report',
            name='languages',
            field=django.contrib.postgres.fields.ArrayField(base_field=models.CharField(max_length=3), default=['ru', 'kk'], size=None),
        ),
    ]
