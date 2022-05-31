from django.db import models
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel
from course.models.lesson import Lesson
from course.models.module import LessonModule
from django.db.models.signals import post_save


class Test(AbstractModel):
    lesson = models.OneToOneField(Lesson, verbose_name=_('Урок'), related_name='course_test', on_delete=models.DO_NOTHING, blank=True, null=True)
    lesson_module = models.ForeignKey(LessonModule, verbose_name=_('Модуль'), on_delete=models.DO_NOTHING, blank=True, null=True)
    max_points = models.PositiveIntegerField(default=0)

    def __str__(self):
        return f"{self.lesson.name_ru}_test_{self.id}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Тест'
        verbose_name_plural = 'Тесты'

def change_course_points(sender, instance, created, **kwargs):
    lesson = instance.lesson
    lesson.score = instance.max_points
    lesson.save()


post_save.connect(change_course_points, sender=Test)