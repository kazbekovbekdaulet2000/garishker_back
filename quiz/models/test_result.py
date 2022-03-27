from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from quiz.models.test import Test
from user.models import User


class TestResult(AbstractModel):
    test = models.ForeignKey(Test, related_name='test_results', on_delete=models.DO_NOTHING)
    user = models.ForeignKey(User, related_name='quiz_test_results', on_delete=models.CASCADE, null=False)
    points = models.PositiveIntegerField(null=True, blank=True, default=0)
    max_points = models.PositiveIntegerField(null=True, blank=True, default=0)
    attempt_num = models.PositiveIntegerField(null=True, blank=True, default=1)

    def __str__(self):
        return self.user.email

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Результат теста'
        verbose_name_plural = 'Результаты тестов'
