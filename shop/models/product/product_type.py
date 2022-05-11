from django.db import models
from config.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _


class ProductType(AbstractModel):
    name_ru = models.CharField(_('Название типа товара (рус)'), max_length=500, default="", blank=True)
    name_kk = models.CharField(_('Название типа товара (каз)'), max_length=500, default="", blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Продукт'
        verbose_name_plural = 'Продукты'