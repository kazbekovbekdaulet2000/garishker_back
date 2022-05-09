# Generated by Django 3.2 on 2022-05-09 05:51

from django.db import migrations, models
import django.db.models.deletion
import shop.models.product_image


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProductImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('image', models.ImageField(blank=True, upload_to=shop.models.product_image.course_dir, verbose_name='Фото')),
                ('image_thumb480', models.ImageField(blank=True, max_length=500, null=True, upload_to=shop.models.product_image.thumb_dir, verbose_name='Фото (480px)')),
                ('image_thumb720', models.ImageField(blank=True, max_length=500, null=True, upload_to=shop.models.product_image.thumb_dir, verbose_name='Фото (720px)')),
                ('image_thumb1080', models.ImageField(blank=True, max_length=500, null=True, upload_to=shop.models.product_image.thumb_dir, verbose_name='Фото (1080px)')),
                ('product', models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, related_name='images', to='shop.product', verbose_name='Продукт')),
            ],
            options={
                'verbose_name': 'Фото',
                'verbose_name_plural': 'Фотографии',
                'ordering': ['-created_at'],
            },
        ),
    ]
