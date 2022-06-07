from django.db import models
from common.contants import DELIVERY_CHOICES
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _


class Order(AbstractModel):
    ord_id = models.CharField(verbose_name=_('Уникальный ID'), max_length=12)
    name = models.CharField(verbose_name=_('Имя заказчика'), max_length=255, null=False)
    email = models.CharField(verbose_name=_('Email'), max_length=255, null=False, default="null")
    phone = models.CharField(verbose_name=_("Телефон"), max_length=16, null=False)
    address = models.CharField(verbose_name=_("Адрес"), max_length=255, null=True, blank=True)
    city = models.CharField(verbose_name=_("Город"), max_length=255, null=True, blank=True)
    post_id = models.CharField(verbose_name=_("Почтовый индекс"), max_length=64, null=True)
    delivery_type = models.PositiveIntegerField(verbose_name=_("Тип доставки"), choices=DELIVERY_CHOICES, default=0)
    delivered = models.BooleanField(verbose_name=_("Доставлен"), default=False)
    total_sum = models.DecimalField(verbose_name=_("Цена (тиын)"), max_digits=9, decimal_places=2, default=0)
    total_discount_sum = models.DecimalField(verbose_name=_("Цена (тиын)"), max_digits=9, decimal_places=2, default=0)
    
    def __str__(self):
        return f"{self.name}, {self.phone} ({self.created_at})"

    class Meta:
        ordering=['-created_at']
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'
