from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from shop.models.order.order import Order


PAYMENT_STATUS = (
    ('PENDING', 'PENDING'),
    ('REQUIRES_ACTION', 'REQUIRES_ACTION'),
    ('APPROVED', 'APPROVED'),
    ('CAPTURED', 'CAPTURED'),
    ('CANCELLED', 'CANCELLED'),
    ('DECLINED', 'DECLINED')
)


class Payment(AbstractModel):
    ioka_order_id = models.CharField(max_length=255)
    order = models.ForeignKey(Order, on_delete=models.CASCADE, null=False, blank=False)
    status = models.CharField(choices=PAYMENT_STATUS, default="PENDING", max_length=16)
    
    def __str__(self):
        return self.order.__str__()

    class Meta:
        verbose_name = 'Оплата'
        verbose_name_plural = 'Оплаты'
