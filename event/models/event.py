from django.db import models
from config.custom_model import AbstractModel, ReactionsAbstract
from django.utils.translation import gettext_lazy as _
from django.db import models
from event.models.city import City
from obrazovanie.models.common_manager import ReactionManager


class Event(AbstractModel, ReactionsAbstract):
    name_ru = models.CharField(_("Название мероприятия (рус)"), max_length=255)
    name_kk = models.CharField(_("Название мероприятия (каз)"), max_length=255)
    description_ru = models.TextField(_("Описание (рус)"), max_length=4096, null=True, blank=True)
    description_kk = models.TextField(_("Описание (каз)"), max_length=4096, null=True, blank=True)
    city = models.ForeignKey(City, on_delete=models.DO_NOTHING, null=False, blank=True)
    address_ru = models.CharField(_("Адрес (рус)"), max_length=255)
    address_kk = models.CharField(_("Адрес (каз)"), max_length=255)
    address_link = models.CharField(_("Адрес (ссылка)"), max_length=4096)
    event_date = models.DateTimeField(_("Время проведения"), null=False, blank=True)
    poster = models.ImageField(upload_to='event-posters', blank=True, null=True)
    canceled = models.BooleanField(default=False)
    views = models.PositiveIntegerField(default=0)
    max_user_count = models.PositiveIntegerField(null=True, blank=True)

    objects = ReactionManager()

    def __str__(self):
        return self.name_ru

    def increase_views(self):
        self.views += 1
        self.save()

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Событие'
        verbose_name_plural = 'События'
