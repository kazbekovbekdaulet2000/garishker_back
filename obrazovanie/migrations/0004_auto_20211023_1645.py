# Generated by Django 3.2.7 on 2021-10-23 10:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('obrazovanie', '0003_auto_20211018_0526'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='section',
            name='created_date',
        ),
        migrations.RemoveField(
            model_name='section',
            name='updated_date',
        ),
    ]