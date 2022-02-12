# Generated by Django 3.2 on 2022-02-12 17:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_auto_20220114_1414'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='full_name',
            new_name='name',
        ),
        migrations.AddField(
            model_name='user',
            name='description',
            field=models.TextField(null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='surname',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
