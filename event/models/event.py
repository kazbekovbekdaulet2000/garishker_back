from django.conf import settings
from django.db import models
from config.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from django.db import models
from rest_framework.response import Response
from rest_framework import status
from event.models.city import City
from user.models import User


class Event(AbstractModel):
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
    saves = models.ManyToManyField(settings.AUTH_USER_MODEL, related_name='event_saves', blank=True)
    views = models.PositiveIntegerField(default=0)
    max_user_count = models.PositiveIntegerField(null=True, blank=True)

    def __str__(self):
        return self.name_ru

    def save_event(self, user: User):
        if(user in self.saves.all()):
            self.saves.remove(user)
            return Response({"bookmarked": False}, status=status.HTTP_202_ACCEPTED)
        else:
            self.saves.add(user)
            return Response({"bookmarked": True}, status=status.HTTP_202_ACCEPTED)
    
    def participate(self, user: User):
        # if self.max_user_count > self.participants.all().count():
        #     if(user in self.participants.all()):
        #         self.participants.remove(user)
        #         return Response({"bookmarked": False}, status=status.HTTP_202_ACCEPTED)
        #     else:
        #         self.participants.add(user)
        #         return Response({"bookmarked": True}, status=status.HTTP_202_ACCEPTED)
        # else: 
        return Response({"status": "no place to serve"}, status=status.HTTP_403_FORBIDDEN)

    def increase_views(self):
        self.views += 1
        self.save()

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Событие'
        verbose_name_plural = 'События'
