# Generated by Django 3.2 on 2022-04-10 09:52

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('course', '0004_auto_20220410_1533'),
    ]

    operations = [
        migrations.AddField(
            model_name='participant',
            name='max_points',
            field=models.PositiveIntegerField(default=0, validators=[django.core.validators.MaxValueValidator(20), django.core.validators.MinValueValidator(0)]),
        ),
    ]