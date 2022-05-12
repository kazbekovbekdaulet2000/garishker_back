# Generated by Django 3.2 on 2022-05-12 17:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0007_product_active'),
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
                ('phone', models.CharField(max_length=16, verbose_name='Телефон')),
                ('address', models.CharField(blank=True, max_length=255, null=True, verbose_name='Адрес')),
                ('delivery_type', models.PositiveIntegerField(choices=[(0, 'Доставка по городу Алматы'), (1, 'Самовывоз (г. Алматы)'), (2, 'Доставка по Казахстану')], default=0, verbose_name='Тип доставки')),
                ('delivered', models.BooleanField(default=False, verbose_name='Доставлен')),
                ('total_sum', models.DecimalField(decimal_places=2, default=0, max_digits=9, verbose_name='Цена (тиын)')),
            ],
            options={
                'verbose_name': 'Заказ',
                'verbose_name_plural': 'Заказы',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='OrderItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('count', models.PositiveIntegerField(default=1)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='products', to='shop.order')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.productitem')),
                ('size', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.productsize')),
            ],
            options={
                'verbose_name': 'Заказ',
                'verbose_name_plural': 'Заказы',
                'ordering': ['-created_at'],
            },
        ),
    ]
