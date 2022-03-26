from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from quiz.models.test import Test
from django.core.validators import MaxValueValidator


TYPE = (
    (0, _('1/5')),
    (1, _('1/4')),
    (3, _('1/2')),
)


class Question(AbstractModel):
    quiz = models.ForeignKey(Test, related_name='quiz_question', on_delete=models.DO_NOTHING)
    technique = models.IntegerField(choices=TYPE, default=0, verbose_name=_("Тип вопроса"))
    title = models.CharField(max_length=255, verbose_name=_("Название"))
    point = models.PositiveIntegerField(default=1, validators=[MaxValueValidator(5),])
    is_active = models.BooleanField(default=False, verbose_name=_("Активный"))

    def __str__(self):
        return self.title

    def __str__(self):
        return f"test_{self.id}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Вопрос'
        verbose_name_plural = 'Вопросы'