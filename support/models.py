from django.db import models
from django.utils.translation import ugettext_lazy as _




class ContactUs(models.Model):
    name = models.CharField(_('Имя'), max_length=500, blank=True)
    email = models.CharField(_('Почта'), max_length=500, blank=True)
    body = models.TextField(_('Текст'), blank=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Поддержка'
        verbose_name_plural = 'Поддержка'


class Question(models.Model):
    question = models.TextField(_('Вопрос'), max_length=120, null=True, blank=True)
    answer = models.TextField(_('Ответ'), max_length=120, null=True, blank=True)

    def __str__(self):
        return self.question

    class Meta:
        verbose_name = 'Вопрос'
        verbose_name_plural = 'Вопросы'

