# Generated by Django 3.2 on 2022-07-02 16:45

import common.s3_storage
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
    ]

    operations = [
        migrations.CreateModel(
            name='VideoURL',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('object_id', models.PositiveIntegerField(null=True)),
                ('original_quality', models.PositiveBigIntegerField(null=True, verbose_name='Качество')),
                ('url', models.URLField(blank=True, null=True)),
                ('video_file', models.FileField(blank=True, null=True, storage=common.s3_storage.S3Storage, upload_to='video-file', verbose_name='Видеофайл')),
                ('url_type', models.PositiveIntegerField(choices=[(0, 'html'), (1, 'youtube'), (2, 'vimeo'), (3, 's3'), (4, 'other')], default='s3')),
                ('convert_status', models.CharField(choices=[('pending', 'Требуется конвертация'), ('downloading', 'Идет загрузка'), ('started', 'Конвертируется'), ('converted', 'Конвертирован'), ('link', 'Ссылка'), ('error', 'Ошибка')], default='pending', max_length=255, verbose_name='Статус конвертации')),
                ('duriation', models.DurationField(blank=True, default=None, null=True, verbose_name='Длительность')),
                ('content_type', models.ForeignKey(limit_choices_to={'id__in': (4, 5, 35, 23, 56)}, null=True, on_delete=django.db.models.deletion.CASCADE, to='contenttypes.contenttype')),
            ],
            options={
                'verbose_name': 'Video',
                'verbose_name_plural': 'Video',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='VideoQualityURL',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('url', models.URLField(blank=True, max_length=4096)),
                ('quality', models.PositiveIntegerField(blank=True)),
                ('video', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='qualities', to='video.videourl')),
            ],
            options={
                'verbose_name': 'VideoQualityURL',
                'verbose_name_plural': 'VideoQualityURL',
                'ordering': ['-created_at'],
            },
        ),
    ]
