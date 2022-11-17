from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.custom_model import AbstractModel


class Organization(AbstractModel):
    name_kk = models.CharField(_('Название (каз)'), max_length=255)
    name_ru = models.CharField(_('Название (рус)'), max_length=255)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    icon = models.ImageField(_('Фото'), null=True, blank=True, upload_to='lector')

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Организации'
        verbose_name_plural = 'Организации'
