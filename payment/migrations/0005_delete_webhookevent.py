# Generated by Django 3.2 on 2022-07-04 22:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0004_donation_key'),
    ]

    operations = [
        migrations.DeleteModel(
            name='WebhookEvent',
        ),
    ]
