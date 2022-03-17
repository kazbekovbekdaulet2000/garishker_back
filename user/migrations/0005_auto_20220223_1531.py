# Generated by Django 3.2 on 2022-02-23 09:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0004_user_user_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='description',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='user',
            name='user_type',
            field=models.PositiveIntegerField(choices=[(0, 'Школьник'), (1, 'Студент'), (2, 'Работаю'), (3, 'Другое')], default=0),
        ),
    ]