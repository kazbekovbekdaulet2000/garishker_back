# Generated by Django 3.2 on 2022-03-26 22:11

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('course', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Test',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('lesson', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='course.lesson', verbose_name='Урок')),
                ('lesson_module', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='course.lessonmodule', verbose_name='Модуль')),
            ],
            options={
                'verbose_name': 'Тест',
                'verbose_name_plural': 'Тесты',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='Question',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('technique', models.IntegerField(choices=[(0, '1/5'), (1, '1/4'), (3, '1/2')], default=0, verbose_name='Тип вопроса')),
                ('title', models.CharField(max_length=255, verbose_name='Название')),
                ('point', models.PositiveIntegerField(default=1, validators=[django.core.validators.MaxValueValidator(5)])),
                ('is_active', models.BooleanField(default=False, verbose_name='Активный')),
                ('quiz', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='quiz_question', to='quiz.test')),
            ],
            options={
                'verbose_name': 'Вопрос',
                'verbose_name_plural': 'Вопросы',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='Answer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('answer_text', models.CharField(max_length=255, verbose_name='Ответ')),
                ('is_right', models.BooleanField(default=False)),
                ('order', models.PositiveIntegerField(blank=True)),
                ('question', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='quiz_answer', to='quiz.question')),
            ],
            options={
                'verbose_name': 'Ответ',
                'verbose_name_plural': 'Ответы',
                'ordering': ['-created_at'],
            },
        ),
    ]
