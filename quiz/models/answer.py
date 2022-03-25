from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from quiz.models.question import Question


class Answer(AbstractModel):
    question = models.ForeignKey(Question, related_name='quiz_answer', on_delete=models.DO_NOTHING)
    answer_text = models.CharField(max_length=255, verbose_name=_("Ответ"))
    is_right = models.BooleanField(default=False)
    order = models.PositiveIntegerField(null=False, blank=True)

    def __str__(self):
        return f"{self.question.title}_{self.order}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Ответ'
        verbose_name_plural = 'Ответы'
