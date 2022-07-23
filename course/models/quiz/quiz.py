from django.db import models
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel
from django.db.models.signals import post_save
from django.core.validators import MinValueValidator, MaxValueValidator
        
PERCENTAGE_VALIDATOR = [MinValueValidator(0), MaxValueValidator(100)]
ATTEMPTS_COUNT_VALIDATOR = [MaxValueValidator(5), ]

class Quiz(AbstractModel):
    name_ru = models.CharField(max_length=255, verbose_name=_('Название (рус)'), null=True, blank=True)
    name_kk = models.CharField(max_length=255, verbose_name=_('Название (каз)'), null=True, blank=True)
    max_points = models.PositiveIntegerField(default=0, editable=False)
    default_pass_percentage = models.DecimalField(verbose_name=_("Процент прохождения"), max_digits=3, decimal_places=0, default=0, validators=PERCENTAGE_VALIDATOR)
    default_attempts_count = models.PositiveIntegerField(verbose_name=_('Количество попыток'), default=3, validators=ATTEMPTS_COUNT_VALIDATOR)

    def __str__(self):
        return f"test_{self.id}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = '[6] Тест'
        verbose_name_plural = '[6] Тесты'

def change_course_points(sender, instance, created, **kwargs):
    print(instance)

post_save.connect(change_course_points, sender=Quiz)