
from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel


class Category(AbstractModel):
    name_ru = models.CharField(_('Название (рус)'), max_length=120)
    name_kk = models.CharField(_('Название (каз)'), max_length=120, default="", blank=True)

    def __str__(self):
        return self.name_ru

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'
