# Generated by Django 3.2 on 2022-04-18 10:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0003_auto_20220415_1341'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='canceled',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='event',
            name='poster',
            field=models.ImageField(blank=True, null=True, upload_to='event-posters'),
        ),
    ]
