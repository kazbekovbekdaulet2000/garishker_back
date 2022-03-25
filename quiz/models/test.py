from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from course.models.lesson import Lesson
from course.models.module import LessonModule


class Test(AbstractModel):
    lesson = models.ForeignKey(Lesson, verbose_name=_('Урок'), on_delete=models.DO_NOTHING, blank=True, null=True)
    lesson_module = models.ForeignKey(LessonModule, verbose_name=_('Модуль'), on_delete=models.DO_NOTHING, blank=True, null=True)

    def __str__(self):
        return f"{self.lesson.name_ru}_test_{self.id}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Тест'
        verbose_name_plural = 'Тесты'