# Generated by Django 3.2 on 2022-07-17 10:57

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('obrazovanie', '0002_auto_20220717_1647'),
    ]

    operations = [
        migrations.RenameField(
            model_name='report',
            old_name='new_video',
            new_name='video',
        ),
    ]