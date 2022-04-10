from django.db import models
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from course.models.lesson import Lesson
from quiz.models.test import Test
from user.models import User
from django.db.models.signals import post_save
from django.contrib.contenttypes.models import ContentType


class TestResult(AbstractModel):
    test = models.ForeignKey(
        Test, related_name='test_results', on_delete=models.DO_NOTHING)
    user = models.ForeignKey(
        User, related_name='quiz_test_results', on_delete=models.CASCADE, null=False)
    points = models.PositiveIntegerField(null=True, blank=True, default=0)
    max_points = models.PositiveIntegerField(null=True, blank=True, default=0)
    attempt_num = models.PositiveIntegerField(null=True, blank=True, default=1)
    success = models.BooleanField(default=False)

    def __str__(self):
        return self.user.email

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Результат теста'
        verbose_name_plural = 'Результаты тестов'


def update_participant_res(sender, instance, created, **kwargs):
    participation = get_object_or_404(instance.user.participation, **{
        'object_id': instance.test.lesson.id,
        'content_type': ContentType.objects.get_for_model(Lesson)
    })
    print(participation.max_points)
    persentage = (instance.points / instance.max_points)
    if(persentage > 0.7):
        instance.success = True
        participation.success = True
        participation.access = True
        participation.points = participation.max_points * persentage
        participation.save()
    else:
        instance.success = False


post_save.connect(update_participant_res, sender=TestResult)
