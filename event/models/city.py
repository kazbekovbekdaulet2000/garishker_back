from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from event.models.country import Country


class City(AbstractModel):
    name_ru = models.CharField(_("Название города (рус)"), max_length=255)
    name_kk = models.CharField(_("Название города (каз)"), max_length=255)
    country = models.ForeignKey(Country, verbose_name=_(
        "Страна"), on_delete=models.CASCADE, related_name='cities', null=True, blank=True, default=None)
    long = models.DecimalField(max_digits=9, decimal_places=6, default=0.0)
    lat = models.DecimalField(max_digits=9, decimal_places=6, default=0.0)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['created_at']
        verbose_name = 'Город'
        verbose_name_plural = 'Города'
