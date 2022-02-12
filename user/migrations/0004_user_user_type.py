# Generated by Django 3.2 on 2022-02-12 17:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0003_auto_20220212_2326'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='user_type',
            field=models.PositiveIntegerField(choices=[(0, 'Люди'), (1, 'Саморазвитие'), (2, 'Честность')], default=0),
        ),
    ]
