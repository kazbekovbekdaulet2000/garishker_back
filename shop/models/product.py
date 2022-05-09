from django.db import models
from config.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _


class Product(AbstractModel):
    name_ru = models.CharField(_('Название (рус)'), max_length=500, default="", blank=True)
    name_kk = models.CharField(_('Название (каз)'), max_length=500, default="", blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)