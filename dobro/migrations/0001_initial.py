# Generated by Django 3.2 on 2022-02-16 17:46

import ckeditor_uploader.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Dobro',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('title', models.CharField(blank=True, max_length=250)),
                ('small_description', models.TextField(blank=True)),
                ('description', models.TextField(blank=True)),
                ('body', ckeditor_uploader.fields.RichTextUploadingField()),
                ('image', models.FileField(blank=True, upload_to='dobro-image')),
                ('video', models.FileField(blank=True, upload_to='dobro-video')),
                ('reports', models.FileField(blank=True, upload_to='dobro-files')),
                ('collected', models.DecimalField(blank=True, decimal_places=2, max_digits=15)),
                ('necessary', models.DecimalField(blank=True, decimal_places=2, max_digits=15)),
                ('is_completed', models.BooleanField(default=False)),
            ],
            options={
                'verbose_name': 'Добро',
                'verbose_name_plural': 'Добро',
            },
        ),
    ]
