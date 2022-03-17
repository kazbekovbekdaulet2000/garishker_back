from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from course.models.lector import Lector
from course.models.course import Course


class Lesson(AbstractModel):
    name_kk = models.CharField(_('Название (каз)'), max_length=255, null=False)
    name_ru = models.CharField(_('Название (рус)'), max_length=255, null=False)
    description_kk = models.TextField(_('Описание (рус)'), blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    duriation = models.DurationField(_("Длительность"), blank=True, null=False)
    lector = models.ForeignKey(Lector,
                               on_delete=models.DO_NOTHING, null=False)
    course = models.ForeignKey(Course, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Урок'
        verbose_name_plural = 'Уроки'
