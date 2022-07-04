# Generated by Django 3.2 on 2022-07-04 19:40

import ckeditor_uploader.fields
import django.contrib.postgres.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('shop', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Donation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('default_options', django.contrib.postgres.fields.ArrayField(base_field=models.IntegerField(), default=[1000, 2000, 5000, 10000, 20000], size=None)),
                ('title_kk', models.CharField(blank=True, max_length=255, null=True)),
                ('title_ru', models.CharField(blank=True, max_length=255, null=True)),
                ('description_kk', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
                ('description_ru', ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True)),
            ],
            options={
                'verbose_name': 'Донат проекты',
                'verbose_name_plural': 'Донат проекты',
            },
        ),
        migrations.CreateModel(
            name='UserDonation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('order_id', models.CharField(max_length=255)),
                ('amount', models.IntegerField(default=100)),
                ('full_name', models.CharField(max_length=255, null=True)),
                ('email', models.EmailField(max_length=255, null=True)),
                ('donation', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='donat', to='payment.donation')),
            ],
            options={
                'verbose_name': 'Донат',
                'verbose_name_plural': 'Донаты',
            },
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('ioka_order_id', models.CharField(max_length=255)),
                ('status', models.CharField(choices=[('PENDING', 'PENDING'), ('REQUIRES_ACTION', 'REQUIRES_ACTION'), ('APPROVED', 'APPROVED'), ('CAPTURED', 'CAPTURED'), ('CANCELLED', 'CANCELLED'), ('DECLINED', 'DECLINED')], default='PENDING', max_length=16)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.order')),
            ],
            options={
                'verbose_name': 'Оплата',
                'verbose_name_plural': 'Оплаты',
            },
        ),
    ]
