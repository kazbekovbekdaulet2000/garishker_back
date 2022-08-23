from django.db import models
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel, ReactionsAbstract
from course.models.course.lector import Lector
from course.models.course.course import Course
from django.db.models.signals import post_save
from course.models.quiz.quiz import Quiz
from video.models.video_url import VideoURL


class Lesson(AbstractModel, ReactionsAbstract):
    name_kk = models.CharField(_('Название (каз)'), max_length=255, null=False)
    name_ru = models.CharField(_('Название (рус)'), max_length=255, null=False)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    duriation = models.DurationField(_("Длительность"), blank=True, null=False)
    lector = models.ForeignKey(Lector, on_delete=models.DO_NOTHING, related_name='lessons', null=False)
    course = models.ForeignKey(Course, on_delete=models.CASCADE, related_name='lessons', null=True)
    video = models.ForeignKey(VideoURL, on_delete=models.DO_NOTHING, null=True, blank=True)
    views = models.PositiveIntegerField(default=0)
    order = models.PositiveIntegerField(default=0)
    quiz = models.ForeignKey(Quiz, on_delete=models.DO_NOTHING, null=True, blank=True)
    
    def __str__(self):
        return self.name_ru

    def increase_views(self):
        self.views += 1
        self.save()
        
    class Meta:
        ordering = ['-created_at']
        verbose_name = '[2] Урок'
        verbose_name_plural = '[2] Уроки'

def update_course(sender, instance, created, **kwargs):
    course = instance.course
    if(created):
        users = course.users.all()
        for user in users:
            user.save()
    course.lesson_count = Lesson.objects.filter(course=course).count()
    course.save()

def update_user_course_lessons(course: Course):
    users = course.users.all()
    for user in users:
        user.save()


post_save.connect(update_course, sender=Lesson)