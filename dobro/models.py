from django.db import models
from config.custom_model import AbstractModel


class Dobro(AbstractModel):
    title = models.CharField(max_length=250, blank=True)
    small_description = models.TextField(blank=True)
    description = models.TextField(blank=True)
    image = models.FileField(upload_to='dobro-image', blank=True)
    video = models.FileField(upload_to='dobro-video', blank=True)
    reports = models.FileField(upload_to='dobro-files', blank=True)
    collected = models.DecimalField(max_digits=15, decimal_places=2, blank=True)
    necessary = models.DecimalField(max_digits=15, decimal_places=2, blank=True)
    is_completed = models.BooleanField(default=False)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Добро'
        verbose_name_plural = 'Добро'