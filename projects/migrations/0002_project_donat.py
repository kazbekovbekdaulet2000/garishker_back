# Generated by Django 3.2 on 2022-07-04 22:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0004_donation_key'),
        ('projects', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='project',
            name='donat',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='payment.donation'),
        ),
    ]
