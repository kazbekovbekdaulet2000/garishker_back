# Generated by Django 3.2.7 on 2021-10-16 08:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('obrazovanie', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='report',
            name='read_time',
            field=models.IntegerField(null=True),
        ),
    ]