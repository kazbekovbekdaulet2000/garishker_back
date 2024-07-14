from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _


class Country(AbstractModel):
    name_ru = models.CharField(_("Название страны (рус)"), max_length=255)
    name_kk = models.CharField(_("Название страны (каз)"), max_length=255)
    
    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['created_at']
        verbose_name = 'Страна'
        verbose_name_plural = 'Страны'
