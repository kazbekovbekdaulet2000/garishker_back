# Generated by Django 3.2 on 2022-01-15 17:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('obrazovanie', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='report',
            name='read_time',
        ),
    ]
