# Generated by Django 3.2 on 2022-05-08 14:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0011_alter_city_country'),
    ]

    operations = [
        migrations.AlterField(
            model_name='city',
            name='country',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='cities', to='event.country', verbose_name='Страна'),
        ),
    ]