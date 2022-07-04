# Generated by Django 3.2 on 2022-07-04 20:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='WebhookEvent',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Создан')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='Изменен')),
                ('payload', models.JSONField()),
            ],
            options={
                'verbose_name': 'WebhookEvent',
                'verbose_name_plural': 'WebhookEvent',
            },
        ),
        migrations.AddField(
            model_name='donation',
            name='required',
            field=models.PositiveIntegerField(),
        ),
        migrations.AddField(
            model_name='userdonation',
            name='ioka_answer',
            field=models.JSONField(),
        ),
    ]