# Generated by Django 3.2 on 2022-07-17 10:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
        ('video', '0002_alter_videourl_content_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='videourl',
            name='content_type',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='contenttypes.contenttype'),
        ),
    ]
