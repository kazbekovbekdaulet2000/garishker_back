# Generated by Django 3.2 on 2022-04-28 08:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0009_city_country'),
    ]

    operations = [
        migrations.AlterField(
            model_name='eventregistration',
            name='email',
            field=models.CharField(blank=True, max_length=255, unique=True, verbose_name='Email'),
        ),
        migrations.AlterField(
            model_name='eventregistration',
            name='phone',
            field=models.CharField(blank=True, max_length=16, null=True, unique=True, verbose_name='Телефон'),
        ),
    ]