# Generated by Django 3.2.7 on 2021-10-15 18:14

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('dobro', '0002_auto_20211015_1812'),
    ]

    operations = [
        migrations.RenameField(
            model_name='dobro',
            old_name='completed',
            new_name='is_completed',
        ),
    ]
