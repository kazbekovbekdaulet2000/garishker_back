from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from django.contrib.postgres.fields import ArrayField
from ckeditor_uploader.fields import RichTextUploadingField


class Donation(AbstractModel):
    default_options = ArrayField(base_field=models.IntegerField(), default=[1000, 2000, 5000, 10000, 20000])
    title_kk = models.CharField(max_length=255, null=True, blank=True)
    title_ru = models.CharField(max_length=255, null=True, blank=True)
    description_kk = RichTextUploadingField(null=True, blank=True)
    description_ru = RichTextUploadingField(null=True, blank=True)

    class Meta:
        verbose_name = 'Донат проекты'
        verbose_name_plural = 'Донат проекты'
