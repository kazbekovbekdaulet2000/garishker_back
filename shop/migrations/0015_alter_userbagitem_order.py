# Generated by Django 3.2 on 2022-05-29 19:20

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0014_auto_20220530_0108'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userbagitem',
            name='order',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='products', to='shop.userbag'),
        ),
    ]