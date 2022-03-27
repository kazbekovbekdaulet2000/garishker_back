# Generated by Django 3.2 on 2022-03-27 08:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('quiz', '0005_alter_test_lesson'),
    ]

    operations = [
        migrations.AddField(
            model_name='attempt',
            name='selected_answer',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='attempt_answer', to='quiz.answer'),
        ),
    ]
