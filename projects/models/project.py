from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from ckeditor_uploader.fields import RichTextUploadingField
from projects.models.const import PROJECT_TYPE, PROJECT_STATUS


class Project(AbstractModel):
    name_kk = models.CharField(_('Название (каз)'), max_length=255)
    name_ru = models.CharField(_('Название (рус)'), max_length=255)
    description_kk = RichTextUploadingField(verbose_name=_('Описание (каз)'))
    description_ru = RichTextUploadingField(verbose_name=_('Описание (рус)'))
    project_type = models.CharField(choices=PROJECT_TYPE, default='reqular', max_length=16, null=False)
    status = models.CharField(choices=PROJECT_STATUS, default='in_process', max_length=16, null=False)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Проект'
        verbose_name_plural = 'Проекты'
