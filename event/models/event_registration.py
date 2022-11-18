from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from event.models.event import Event
from django.db import models


class EventRegistration(AbstractModel):
    event = models.ForeignKey(
        Event, related_name='participants', on_delete=models.CASCADE, null=False)
    email = models.CharField(
        _("Email"), max_length=255, null=False, blank=True, unique=False)
    name = models.CharField(
        _("Имя человека"), max_length=255, null=False, blank=True)
    phone = models.CharField(
        _("Телефон"), max_length=255, null=True, blank=True, unique=False)
    # regex=r'^\+?1?\d{9,15}$',

    def __str__(self):
        return f"{self.email} ({self.name})"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Регистрация'
        verbose_name_plural = 'Регистрация'
        unique_together = ['event', 'email', 'phone']
