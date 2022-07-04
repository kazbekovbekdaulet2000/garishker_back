from django.db import models
from common.custom_model import AbstractModel, ContentTypeModel
from django.contrib.contenttypes.models import ContentType
from event.models.event import Event
from obrazovanie.models.video import Video
from obrazovanie.models.report import Report
from projects.models.project_periodic import ProjectPeriod
from django.utils.translation import gettext_lazy as _
from django.contrib.postgres.fields import ArrayField
from ckeditor_uploader.fields import RichTextUploadingField
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
