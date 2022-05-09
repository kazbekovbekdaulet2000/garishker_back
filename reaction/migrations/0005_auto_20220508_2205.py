# Generated by Django 3.2 on 2022-05-08 16:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reaction', '0004_auto_20220508_1927'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bookmark',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, verbose_name='Создан'),
        ),
        migrations.AlterField(
            model_name='bookmark',
            name='updated_at',
            field=models.DateTimeField(auto_now=True, verbose_name='Изменен'),
        ),
        migrations.AlterField(
            model_name='comment',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, verbose_name='Создан'),
        ),
        migrations.AlterField(
            model_name='comment',
            name='updated_at',
            field=models.DateTimeField(auto_now=True, verbose_name='Изменен'),
        ),
        migrations.AlterField(
            model_name='like',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, verbose_name='Создан'),
        ),
        migrations.AlterField(
            model_name='like',
            name='updated_at',
            field=models.DateTimeField(auto_now=True, verbose_name='Изменен'),
        ),
        migrations.AlterField(
            model_name='review',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, verbose_name='Создан'),
        ),
        migrations.AlterField(
            model_name='review',
            name='updated_at',
            field=models.DateTimeField(auto_now=True, verbose_name='Изменен'),
        ),
    ]
