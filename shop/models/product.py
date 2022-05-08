from django.conf import settings
from django.db import models
from config.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _


class Product(AbstractModel):
    name_ru = models.CharField(
        _('Название (рус)'), max_length=500, default="", blank=True)
    name_kk = models.CharField(
        _('Название (каз)'), max_length=500, default="", blank=True)
    # image = models.FileField(_('Обложка'), upload_to='video-image', blank=True)
    # saves = models.ManyToManyField(
    #     settings.AUTH_USER_MODEL, related_name='video_saves', blank=True)
    # likes = models.ManyToManyField(User, related_name='video_likes', blank=True)
    # views = models.PositiveIntegerField(default=0)
    # convert_status = models.CharField(_('Статус конвертации'), max_length=255,
    #                                   choices=VIDEO_CONVERSION_STATUS_CHOICES,
    #                                   default='pending')
    # duriation = models.DurationField(
    #     _("Длительность"), blank=True, null=False, default="00:00")
    # video_quality = models.ManyToManyField(
    #     VideoQuality, related_name='video_qualities')
