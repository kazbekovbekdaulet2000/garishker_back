from django.db import models
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel
from course.models.quiz.question import Question


class Answer(AbstractModel):
    question = models.ForeignKey(Question, related_name='answers', on_delete=models.CASCADE)
    answer_kk = models.CharField(max_length=255, verbose_name=_("Ответ (каз)"))
    answer_ru = models.CharField(max_length=255, verbose_name=_("Ответ (рус)"))
    correct = models.BooleanField(default=False)

    def __str__(self):
        return self.answer_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = '[8] Ответ'
        verbose_name_plural = '[8] Ответы'