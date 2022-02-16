from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel


class ContactUs(AbstractModel):
    name = models.CharField(_('Имя'), max_length=65535, blank=True)
    email = models.CharField(_('Почта'), max_length=65535, blank=True)
    body = models.TextField(_('Текст'), blank=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Поддержка'
        verbose_name_plural = 'Поддержка'


class Question(AbstractModel):
    question = models.TextField(_('Вопрос'), max_length=65535, null=True, blank=True)
    answer = models.TextField(_('Ответ'), max_length=65535, null=True, blank=True)

    def __str__(self):
        return self.question

    class Meta:
        verbose_name = 'Вопрос'
        verbose_name_plural = 'Вопросы'
