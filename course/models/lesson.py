from django.db import models
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel
from course.models.lector import Lector
from course.models.course import Course
from course.models.module import LessonModule
from django.db.models.signals import post_save

from video.models.video_url import VideoURL

class Lesson(AbstractModel):
    name_kk = models.CharField(_('Название (каз)'), max_length=255, null=False)
    name_ru = models.CharField(_('Название (рус)'), max_length=255, null=False)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    duriation = models.DurationField(_("Длительность"), blank=True, null=False)
    lector = models.ForeignKey(Lector, on_delete=models.DO_NOTHING, related_name='lesson_lector', null=False)
    course = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='course_lesson', null=True)
    video = models.ForeignKey(VideoURL, on_delete=models.DO_NOTHING, null=True, blank=True)
    modules = models.ManyToManyField(LessonModule, verbose_name='Модули', blank=True)
    views = models.PositiveIntegerField(default=0)
    order = models.PositiveIntegerField(default=0)
    score = models.PositiveIntegerField(default=0)
    
    def __str__(self):
        return self.name_ru

    def increase_views(self):
        self.views += 1
        self.save()
        
    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Урок'
        verbose_name_plural = 'Уроки'

def update_course(sender, instance, created, **kwargs):
    course = instance.course
    course.lesson_count = Lesson.objects.filter(course=course).count()
    course.lectors.add(instance.lector)
    course.save()

post_save.connect(update_course, sender=Lesson)