# Generated by Django 3.2.7 on 2021-10-15 17:50

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
                ('title', models.CharField(blank=True, max_length=250)),
                ('small_description', models.TextField(blank=True)),
                ('description', models.TextField(blank=True)),
                ('image', models.FileField(blank=True, upload_to='dobro-image')),
                ('video', models.FileField(blank=True, upload_to='dobro-video')),
                ('reports', models.FileField(blank=True, upload_to='dobro-files')),
                ('collected', models.DecimalField(blank=True, decimal_places=2, max_digits=15)),
                ('necessary', models.DecimalField(blank=True, decimal_places=2, max_digits=15)),
            ],
        ),
    ]
