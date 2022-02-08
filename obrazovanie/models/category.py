
from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel


class Category(AbstractModel):
    name = models.CharField(_('Название'), max_length=120)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'
