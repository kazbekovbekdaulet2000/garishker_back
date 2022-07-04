from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from shop.models.order.order import Order


class WebhookEvent(AbstractModel):
    payload = models.JSONField()

    class Meta:
        verbose_name = 'WebhookEvent'
        verbose_name_plural = 'WebhookEvent'
