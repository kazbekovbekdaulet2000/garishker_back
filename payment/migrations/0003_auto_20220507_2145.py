# Generated by Django 3.2 on 2022-05-07 15:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0002_customer'),
    ]

    operations = [
        migrations.AddField(
            model_name='donation',
            name='shop_id',
            field=models.CharField(default='1', max_length=255),
        ),
        migrations.AddField(
            model_name='donation',
            name='status',
            field=models.CharField(default='PENDING', max_length=255),
        ),
        migrations.AlterField(
            model_name='donation',
            name='order_id',
            field=models.CharField(default='1', max_length=255),
        ),
    ]
