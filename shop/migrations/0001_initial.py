# Generated by Django 3.2 on 2022-06-29 14:45

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import shop.models.product.product_image
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('ord_id', models.CharField(max_length=12, verbose_name='Уникальный ID')),
                ('name', models.CharField(max_length=255, verbose_name='Имя заказчика')),
                ('email', models.CharField(default='null', max_length=255, verbose_name='Email')),
                ('phone', models.CharField(max_length=16, verbose_name='Телефон')),
                ('address', models.CharField(blank=True, max_length=255, null=True, verbose_name='Адрес')),
                ('city', models.CharField(blank=True, max_length=255, null=True, verbose_name='Город')),
                ('post_id', models.CharField(max_length=64, null=True, verbose_name='Почтовый индекс')),
                ('delivery_type', models.PositiveIntegerField(choices=[(0, 'Доставка по городу Алматы'), (1, 'Самовывоз (г. Алматы)'), (2, 'Доставка по Казахстану')], default=0, verbose_name='Тип доставки')),
                ('delivered', models.BooleanField(default=False, verbose_name='Доставлен')),
                ('total_sum', models.DecimalField(decimal_places=2, default=0, max_digits=9, verbose_name='Цена (тиын)')),
                ('total_discount_sum', models.DecimalField(decimal_places=2, default=0, max_digits=9, verbose_name='Цена (тиын)')),
            ],
            options={
                'verbose_name': 'Заказ',
                'verbose_name_plural': 'Заказы',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('likes_count', models.PositiveIntegerField(default=0, verbose_name='Лайки')),
                ('comments_count', models.PositiveIntegerField(default=0, verbose_name='Комментарии')),
                ('reviews_count', models.PositiveIntegerField(default=0, verbose_name='Рейтинг')),
                ('bookmarks_count', models.PositiveIntegerField(default=0, verbose_name='Сохранения')),
                ('name_ru', models.CharField(blank=True, default='', max_length=500, verbose_name='Название (рус)')),
                ('name_kk', models.CharField(blank=True, default='', max_length=500, verbose_name='Название (каз)')),
                ('description_ru', models.TextField(blank=True, verbose_name='Описание (рус)')),
                ('description_kk', models.TextField(blank=True, verbose_name='Описание (каз)')),
                ('price', models.PositiveIntegerField(default=9990)),
                ('g_token_price', models.PositiveIntegerField(blank=True, default=149, null=True)),
                ('discount', models.PositiveIntegerField(default=0, validators=[django.core.validators.MaxValueValidator(100), django.core.validators.MinValueValidator(0)])),
                ('care_ru', models.TextField(blank=True, verbose_name='Уход (рус)')),
                ('care_kk', models.TextField(blank=True, verbose_name='Уход (каз)')),
                ('active', models.BooleanField(default=True, verbose_name='Активный')),
            ],
            options={
                'verbose_name': 'Продукт',
                'verbose_name_plural': 'Продукты',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='ProductCategory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('name_ru', models.CharField(blank=True, default='', max_length=500, verbose_name='Название (рус)')),
                ('name_kk', models.CharField(blank=True, default='', max_length=500, verbose_name='Название (каз)')),
            ],
            options={
                'verbose_name': 'Категория',
                'verbose_name_plural': 'Категории',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='ProductCompound',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('name_ru', models.CharField(blank=True, default='', max_length=500, verbose_name='Название типа товара (рус)')),
                ('name_kk', models.CharField(blank=True, default='', max_length=500, verbose_name='Название типа товара (каз)')),
            ],
            options={
                'verbose_name': 'Состав Продукта',
                'verbose_name_plural': 'Состав Продукта',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='ProductSize',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('size', models.PositiveIntegerField(blank=True, default=38, verbose_name='Размер')),
                ('size_global', models.CharField(blank=True, choices=[('XXS', 'XXS'), ('XS', 'XS'), ('S', 'S'), ('M', 'M'), ('L', 'L'), ('XL', 'XL'), ('XXL', 'XXL'), ('XXXL', 'XXXL')], max_length=6, null=True, verbose_name='Международное обозначение')),
                ('bust', models.PositiveIntegerField(blank=True, null=True, verbose_name='Обхват груди, см')),
                ('waist', models.PositiveIntegerField(blank=True, null=True, verbose_name='Обхват талии, см')),
                ('hips', models.PositiveIntegerField(blank=True, null=True, verbose_name='Обхват бедер, см')),
                ('gender', models.PositiveIntegerField(blank=True, choices=[(0, 'Женский'), (1, 'Мужской'), (2, 'Унисекс')], default=2, verbose_name='Пол')),
                ('type', models.PositiveIntegerField(blank=True, choices=[(0, 'Одежда'), (1, 'Головные уборы'), (2, 'Обувь')], default=0, verbose_name='Тип размера')),
            ],
            options={
                'verbose_name': 'Размер',
                'verbose_name_plural': 'Размеры',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='UserBag',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
            ],
            options={
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='UserBagItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('count', models.PositiveIntegerField(default=1)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='products', to='shop.userbag')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.product')),
                ('size', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.productsize')),
            ],
            options={
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='ProductItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('count', models.PositiveIntegerField(default=10, verbose_name='Количество доступное')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='items', to='shop.product', verbose_name='Продукт')),
                ('size', models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='shop.productsize', verbose_name='Размер')),
            ],
            options={
                'verbose_name': 'Размер продукта',
                'verbose_name_plural': 'Размеры продукта',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='ProductImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('image', models.ImageField(blank=True, upload_to=shop.models.product.product_image.course_dir, verbose_name='Фото')),
                ('image_thumb480', models.ImageField(blank=True, max_length=500, null=True, upload_to=shop.models.product.product_image.thumb_dir, verbose_name='Фото (480px)')),
                ('image_thumb720', models.ImageField(blank=True, max_length=500, null=True, upload_to=shop.models.product.product_image.thumb_dir, verbose_name='Фото (720px)')),
                ('image_thumb1080', models.ImageField(blank=True, max_length=500, null=True, upload_to=shop.models.product.product_image.thumb_dir, verbose_name='Фото (1080px)')),
                ('product', models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, related_name='images', to='shop.product', verbose_name='Продукт')),
            ],
            options={
                'verbose_name': 'Фото',
                'verbose_name_plural': 'Фотографии',
                'ordering': ['-created_at'],
            },
        ),
        migrations.AddField(
            model_name='product',
            name='category',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='shop.productcategory'),
        ),
        migrations.AddField(
            model_name='product',
            name='compound',
            field=models.ManyToManyField(blank=True, to='shop.ProductCompound'),
        ),
        migrations.CreateModel(
            name='OrderItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('count', models.PositiveIntegerField(default=1)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='products', to='shop.order')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.product')),
                ('size', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.productsize')),
            ],
            options={
                'verbose_name': 'Заказ',
                'verbose_name_plural': 'Заказы',
                'ordering': ['-created_at'],
            },
        ),
    ]
