from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from config.custom_model import AbstractModel
from course.models.lector import Lector
from obrazovanie.models.category import Category
from organizations.models import Organization
from user.models import User


class Course(AbstractModel):
    name_kk = models.CharField(_('Название (каз)'), max_length=255, null=False)
    name_ru = models.CharField(_('Название (рус)'), max_length=255, null=False)
    description_kk = models.TextField(_('Описание (рус)'), blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    organization = models.ForeignKey(Organization,
                                     on_delete=models.CASCADE, null=True)

    lectors = models.ManyToManyField(
        Lector, blank=True, null=True, editable=False)
    category = models.ForeignKey(Category, verbose_name="Категория",
                                 on_delete=models.DO_NOTHING, related_name='course_category', blank=True)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Курс'
        verbose_name_plural = 'Курсы'
