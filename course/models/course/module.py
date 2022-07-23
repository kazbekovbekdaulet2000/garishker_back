from django.db import models
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel, ReactionsAbstract
from course.models.course.lector import Lector
from course.models.course.lesson import Lesson
from course.models.quiz.quiz import Quiz


class LessonModule(AbstractModel, ReactionsAbstract):
    name_kk = models.CharField(_('Название (каз)'), max_length=255, null=False)
    name_ru = models.CharField(_('Название (рус)'), max_length=255, null=False)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    duriation = models.DurationField(_("Длительность"), blank=True, null=False)
    lector = models.ForeignKey(Lector, on_delete=models.DO_NOTHING, related_name='lesson_modules', null=False)
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE, related_name='lesson_modules', null=True)
    video = models.CharField(_('Название видео с расширением)'), max_length=6250, default="", blank=True)
    quiz = models.ForeignKey(Quiz, on_delete=models.DO_NOTHING, null=True, blank=True)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = '[3] Модуль'
        verbose_name_plural = '[3] Модули'
