# Generated by Django 3.2 on 2022-05-08 13:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('obrazovanie', '0011_auto_20220508_1913'),
    ]

    operations = [
        migrations.RenameField(
            model_name='report',
            old_name='reviews_count',
            new_name='reviews_count',
        ),
        migrations.RenameField(
            model_name='video',
            old_name='reviews_count',
            new_name='reviews_count',
        ),
    ]
