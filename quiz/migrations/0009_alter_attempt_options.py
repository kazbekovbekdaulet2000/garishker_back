# Generated by Django 3.2 on 2022-04-10 21:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('quiz', '0008_testresult_success'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='attempt',
            options={'ordering': ['created_at'], 'verbose_name': 'Ответ', 'verbose_name_plural': 'Ответы'},
        ),
    ]