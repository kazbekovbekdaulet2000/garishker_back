from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from course.models.lector import Lector
from course.models.course import Course


class LessonModule(AbstractModel):
    name_kk = models.CharField(_('Название (каз)'), max_length=255, null=False)
    name_ru = models.CharField(_('Название (рус)'), max_length=255, null=False)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    duriation = models.DurationField(_("Длительность"), blank=True, null=False)
    lector = models.ForeignKey(Lector, on_delete=models.DO_NOTHING, related_name='lesson_module_lector', null=False)
    course = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='lesson_module_course', null=True)
    video = models.CharField(_('Название видео с расширением)'), max_length=6250, default="", blank=True)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Модуль'
        verbose_name_plural = 'Модули'
