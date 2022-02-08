# Generated by Django 3.2 on 2022-02-08 10:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('obrazovanie', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='video',
            name='convert_status',
            field=models.CharField(choices=[('pending', 'Требуется конвертация'), ('started', 'Конвертируется'), ('converted', 'Конвертирован'), ('error', 'Ошибка')], default='pending', max_length=255),
        ),
    ]
