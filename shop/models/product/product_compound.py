from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _


class ProductCompound(AbstractModel):
    name_ru = models.CharField(_('Название типа товара (рус)'), max_length=500, default="", blank=True)
    name_kk = models.CharField(_('Название типа товара (каз)'), max_length=500, default="", blank=True)
  
    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Состав Продукта'
        verbose_name_plural = 'Состав Продукта'