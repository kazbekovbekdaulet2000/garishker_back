# Generated by Django 3.2 on 2022-05-29 19:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0013_auto_20220530_0104'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='UserOrder',
            new_name='UserBag',
        ),
        migrations.RenameModel(
            old_name='UserOrderItem',
            new_name='UserBagItem',
        ),
    ]
