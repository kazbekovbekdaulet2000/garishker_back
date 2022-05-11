from django.db import models
from config.custom_model import AbstractModel, ReactionsAbstract
from django.utils.translation import gettext_lazy as _
from shop.models.product.product_category import ProductCategory
from django.core.validators import MaxValueValidator, MinValueValidator
from shop.models.product.product_compound import ProductCompound


class Order(AbstractModel):
    ord_id = models.CharField(verbose_name=_('Уникальный ID'), max_length=12)
    product

    def __str__(self):
        return self.ord_id

    class Meta:
        ordering=['-created_at']
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'