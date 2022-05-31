from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.custom_model import AbstractModel


class Lector(AbstractModel):
    name = models.CharField(_('Имя'), max_length=255, null=False)
    surname = models.CharField(_('Фамилия'), max_length=255, null=False)
    role_kk = models.TextField(_('Сфера деятельности (каз)'), max_length=500, null=True)
    role_ru = models.TextField(_('Сфера деятельности (рус)'), max_length=500, null=True)
    description_kk = models.TextField(_('Описание (каз)'), max_length=500, null=True)
    description_ru = models.TextField(_('Описание (рус)'), max_length=500, null=True)
    icon = models.ImageField(_('Фото'), null=True, blank=True, upload_to='lector', default='garysh.jpg')

    def __str__(self):
        return f"{self.name} {self.surname}"

    def get_fullname(self):
        return f"{self.name} {self.surname}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Лектор'
        verbose_name_plural = 'Лекторы'
