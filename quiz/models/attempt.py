from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from quiz.models.answer import Answer
from user.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey


class Attempt(AbstractModel):
    user = models.ForeignKey(User, related_name='quiz_answer_attempt', on_delete=models.CASCADE, null=False)
    is_correct = models.BooleanField(default=False)
    selected_answer = models.ForeignKey(Answer, related_name='attempt_answer', on_delete=models.DO_NOTHING, null=True, blank=True)
    attempt_num = models.PositiveIntegerField(null=True, blank=True, default=1)
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, null=True)
    object_id = models.PositiveIntegerField(null=True)
    content_object = GenericForeignKey('content_type', 'object_id')

    def __str__(self):
        return self.user.email

    class Meta:
        ordering = ['created_at']
        verbose_name = 'Ответ'
        verbose_name_plural = 'Ответы'
