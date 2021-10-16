# Generated by Django 3.2.7 on 2021-10-16 08:30

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ContactUs',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=500, verbose_name='Название')),
                ('email', models.CharField(blank=True, max_length=500, verbose_name='Логин')),
                ('body', models.TextField(blank=True, verbose_name='Текст')),
            ],
            options={
                'verbose_name': 'Поддержка',
                'verbose_name_plural': 'Поддержка',
            },
        ),
        migrations.CreateModel(
            name='Question',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('question', models.TextField(blank=True, max_length=120, null=True, verbose_name='Вопрос')),
                ('answer', models.TextField(blank=True, max_length=120, null=True, verbose_name='Ответ')),
            ],
            options={
                'verbose_name': 'Вопрос',
                'verbose_name_plural': 'Вопросы',
            },
        ),
    ]
