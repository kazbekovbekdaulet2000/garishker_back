from django.db import models
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel
from quiz.models.question import Question


class AnserManager(models.Manager):
    def answer_ids(self):
        return self.all().values_list('id', flat=True)
    def correct_answer(self):
        # if(self.filter(is_right=True).count()>1):
        #     return self.filter(is_right=True)
        return self.filter(is_right=True).first()


class Answer(AbstractModel):
    question = models.ForeignKey(
        Question, related_name='quiz_answer', on_delete=models.DO_NOTHING)
    answer_text = models.CharField(max_length=255, verbose_name=_("Ответ"))
    is_right = models.BooleanField(default=False)
    order = models.PositiveIntegerField(null=False, blank=True)

    objects = AnserManager()

    def __str__(self):
        return f"{self.question.title}_{self.order}"

    class Meta:
        ordering = ['order']
        verbose_name = 'Ответ'
        verbose_name_plural = 'Ответы'
