from django.db import models
from common.custom_model import AbstractModel, ReactionsAbstract
from django.utils.translation import gettext_lazy as _
from django.db import models
from event.models.city import City
from obrazovanie.models.common_manager import ReactionManager
from utils.image_progressive import create_thumbnail, has_changed
from video.models.video_url import VideoURL
from ckeditor_uploader.fields import RichTextUploadingField


class Event(AbstractModel, ReactionsAbstract):
    name_ru = models.CharField(_("Название мероприятия (рус)"), max_length=255)
    name_kk = models.CharField(_("Название мероприятия (каз)"), max_length=255)
    description_ru = RichTextUploadingField(_("Описание (рус)"), null=True, blank=True)
    description_kk = RichTextUploadingField(_("Описание (каз)"), null=True, blank=True)
    city = models.ForeignKey(City, on_delete=models.DO_NOTHING, null=False, blank=True)
    address_ru = models.CharField(_("Адрес (рус)"), max_length=255)
    address_kk = models.CharField(_("Адрес (каз)"), max_length=255)
    address_link = models.URLField(_("Адрес (ссылка)"), max_length=4096, null=True, blank=True)
    event_date = models.DateTimeField(_("Время проведения"), null=False, blank=True)
    poster = models.ImageField(upload_to='event-posters', blank=True, null=True)
    canceled = models.BooleanField(default=False)
    views = models.PositiveIntegerField(default=0)
    max_user_count = models.PositiveIntegerField(null=True, blank=True)
    video = models.ForeignKey(VideoURL, on_delete=models.DO_NOTHING, null=True, blank=True)


    objects = ReactionManager()

    def __str__(self):
        return self.name_ru

    def increase_views(self):
        self.views += 1
        self.save()

    def save(self, *args, **kwargs):
        if (has_changed(self, 'poster')):
            self.poster = create_thumbnail(self.poster, 720)
        force_update = False
        if self.id:
            force_update = True
        super(Event, self).save(force_update=force_update, *args, **kwargs)


    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Событие'
        verbose_name_plural = 'События'
