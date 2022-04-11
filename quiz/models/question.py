from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from quiz.models.test import Test
from django.core.validators import MaxValueValidator
from django.db.models.signals import post_save


TYPE = (
    (0, _('1/5')),
    (1, _('1/4')),
    (3, _('1/2')),
)


class QuestionManager(models.Manager):
    def max_points(self) -> int:
        point = 0
        for question in self.filter(is_active=True):
            point += question.point
        return point



class Question(AbstractModel):
    quiz = models.ForeignKey(Test, related_name='quiz_question', on_delete=models.DO_NOTHING)
    technique = models.IntegerField(choices=TYPE, default=0, verbose_name=_("Тип вопроса"))
    title = models.CharField(max_length=255, verbose_name=_("Название"))
    point = models.PositiveIntegerField(default=1, validators=[MaxValueValidator(5),])
    is_active = models.BooleanField(default=False, verbose_name=_("Активный"))
    
    objects = QuestionManager()
    
    def __str__(self):
        return f"test_{self.id}"

    class Meta:
        ordering = ['created_at']
        verbose_name = 'Вопрос'
        verbose_name_plural = 'Вопросы'

def change_test_points(sender, instance, created, **kwargs):
    test = instance.quiz
    questions = test.quiz_question.filter(is_active=True)
    points = 0
    for question in questions:
        points+=question.point
    test.max_points=points
    test.save()


post_save.connect(change_test_points, sender=Question)