from django.db import models
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel
from django.core.validators import MaxValueValidator
from django.db.models.signals import post_save, post_delete
from course.models.quiz.quiz import Quiz
from ckeditor_uploader.fields import RichTextUploadingField


class Question(AbstractModel):
    quiz = models.ForeignKey(Quiz, related_name='questions', on_delete=models.DO_NOTHING)
    question_kk = RichTextUploadingField(verbose_name=_('Вопрос (каз)'))
    question_ru = RichTextUploadingField(verbose_name=_("Вопрос (рус)"))
    point = models.PositiveIntegerField(default=1, validators=[MaxValueValidator(5),])
    is_active = models.BooleanField(default=False, verbose_name=_("Активный"))
    
    def __str__(self):
        return self.question_ru

    class Meta:
        ordering = ['created_at']
        verbose_name = '[7] Вопрос'
        verbose_name_plural = '[7] Вопросы'

def change_question(sender, instance, created, **kwargs):
    quiz = instance.quiz 
    points = quiz.questions.filter(is_active=True).values_list('point', flat=True)
    quiz.max_points = sum(list(points))
    quiz.save()

def delete_question(**kwargs):
    instance = kwargs['instance']
    quiz = instance.quiz 
    if(instance.is_active):
        quiz.max_points -= instance.point
    quiz.save()

post_save.connect(change_question, sender=Question)
post_delete.connect(delete_question, sender=Question)