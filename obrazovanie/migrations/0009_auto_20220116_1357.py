# Generated by Django 3.2 on 2022-01-16 07:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('obrazovanie', '0008_auto_20220116_1355'),
    ]

    operations = [
        migrations.AlterField(
            model_name='report',
            name='views',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='video',
            name='views',
            field=models.PositiveIntegerField(default=0),
        ),
    ]
