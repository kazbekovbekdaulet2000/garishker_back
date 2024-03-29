# Generated by Django 3.2 on 2022-08-28 11:37

import ckeditor_uploader.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0002_event_video'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='address_link',
            field=models.URLField(blank=True, max_length=4096, null=True, verbose_name='Адрес (ссылка)'),
        ),
        migrations.AlterField(
            model_name='event',
            name='description_kk',
            field=ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True, verbose_name='Описание (каз)'),
        ),
        migrations.AlterField(
            model_name='event',
            name='description_ru',
            field=ckeditor_uploader.fields.RichTextUploadingField(blank=True, null=True, verbose_name='Описание (рус)'),
        ),
    ]
