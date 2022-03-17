from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from config.custom_model import AbstractModel
from obrazovanie.models.category import Category
from user.models import User


class Lector(AbstractModel):
    name = models.CharField(_('Имя'), max_length=255, null=False)
    surname = models.CharField(_('Фамилия'), max_length=255, null=False)
    description_kk = models.TextField(_('Описание (каз)'), max_length=500, null=True)
    description_ru = models.TextField(_('Описание (рус)'), max_length=500, null=True)
    icon = models.ImageField(_('Фото'), null=True, blank=True, upload_to='lector', default='garysh.jpg')

    def __str__(self):
        return f"{self.name} {self.surname}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Лектор'
        verbose_name_plural = 'Лекторы'
