from django.db import models
from config.custom_model import AbstractModel, ReactionsAbstract
from django.utils.translation import gettext_lazy as _
from shop.models.product.product_category import ProductCategory
from django.core.validators import MaxValueValidator, MinValueValidator
from shop.models.product.product_compound import ProductCompound


class Product(AbstractModel, ReactionsAbstract):
    name_ru = models.CharField(_('Название (рус)'), max_length=500, default="", blank=True)
    name_kk = models.CharField(_('Название (каз)'), max_length=500, default="", blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)
    category = models.ForeignKey(ProductCategory, null=True, blank=True, on_delete=models.DO_NOTHING)

    price = models.PositiveIntegerField(default=9990, null=False, blank=False)
    g_token_price = models.PositiveIntegerField(default=149, null=True, blank=True)

    discount = models.PositiveIntegerField(default=0, validators=(MaxValueValidator(100), MinValueValidator(0)))
    compound = models.ManyToManyField(ProductCompound, blank=True)
    care_ru = models.TextField(_('Уход (рус)'), blank=True)
    care_kk = models.TextField(_('Уход (каз)'), blank=True)

    active = models.BooleanField(_('Активный'), default=True)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering=['-created_at']
        verbose_name = 'Продукт'
        verbose_name_plural = 'Продукты'