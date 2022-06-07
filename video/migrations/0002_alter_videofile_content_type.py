# Generated by Django 3.2 on 2022-06-03 08:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
        ('video', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='videofile',
            name='content_type',
            field=models.ForeignKey(limit_choices_to={'id__in': (4, 5, 35)}, null=True, on_delete=django.db.models.deletion.CASCADE, to='contenttypes.contenttype'),
        ),
    ]
