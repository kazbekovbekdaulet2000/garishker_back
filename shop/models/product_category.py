from django.db import models
from config.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _


class ProductCategory(AbstractModel):
    name_ru = models.CharField(_('Название (рус)'), max_length=500, default="", blank=True)
    name_kk = models.CharField(_('Название (каз)'), max_length=500, default="", blank=True)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'