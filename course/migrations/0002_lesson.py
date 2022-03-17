# Generated by Django 3.2 on 2022-03-15 18:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('course', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Lesson',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name_kk', models.CharField(max_length=255, verbose_name='Название (каз)')),
                ('name_ru', models.CharField(max_length=255, verbose_name='Название (рус)')),
                ('description_kk', models.TextField(blank=True, verbose_name='Описание (рус)')),
                ('description_ru', models.TextField(blank=True, verbose_name='Описание (рус)')),
                ('duriation', models.TimeField(blank=True, verbose_name='Длительность')),
                ('lector', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='course.lector')),
            ],
            options={
                'verbose_name': 'Курс',
                'verbose_name_plural': 'Курсы',
                'ordering': ['-created_at'],
            },
        ),
    ]
