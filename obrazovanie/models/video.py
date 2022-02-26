
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.conf import settings
from config.custom_model import AbstractModel
from obrazovanie.models.category import Category
from user.models import User
from ckeditor_uploader.fields import RichTextUploadingField
from config.yandex_storage import ClientDocsStorage

VIDEO_CONVERSION_STATUS_CHOICES = (
    ('pending', _('Требуется конвертация')),
    ('started', _('Конвертируется')),
    ('converted', _('Конвертирован')),
    ('error', _('Ошибка')),
)


class VideoQuality(AbstractModel):
    path = models.CharField(_('Путь'), max_length=5000)
    quality = models.PositiveIntegerField(_('Качество'), null=True)
    width = models.PositiveIntegerField(_('Ширина'), null=True)
    height = models.PositiveIntegerField(_('Высота'), null=True)

    def __str__(self):
        return self.path


class Video(AbstractModel):
    title = models.CharField(_('Название'), max_length=500)
    body = RichTextUploadingField()
    image = models.FileField(_('Обложка'), upload_to='video-image', blank=True)
    image_2 = models.FileField(_('Обложка вторая'), upload_to='video-image', blank=True)
    category = models.ForeignKey(Category, verbose_name="Категория",
                                 on_delete=models.DO_NOTHING, related_name='video_category')
    video = models.FileField(
        _('Видео'), upload_to='video-video', storage=ClientDocsStorage, null=True)
    video_name = models.CharField(
        _('Название видео с расширением)'), max_length=6250, default="")
    original_quality = models.PositiveBigIntegerField(_('Качество'), null=True)
    author = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING, null=True, related_name='video_author')
    saves = models.ManyToManyField(
        settings.AUTH_USER_MODEL, related_name='video_saves', blank=True)
    likes = models.ManyToManyField(
        User, related_name='video_likes', blank=True)
    views = models.PositiveIntegerField(default=0)
    convert_status = models.CharField(
        _('Статус конвертации'),
        max_length=255,
        choices=VIDEO_CONVERSION_STATUS_CHOICES,
        default='pending')
    video_quality = models.ManyToManyField(
        VideoQuality, related_name='video_qualities')

    def __str__(self):
        return self.title

    def increase_views(self):
        self.views += 1
        self.save()

    def set_quality(self, quality):
        self.original_quality = quality
        self.save()

    class Meta:
        ordering = ['-created_at', '-views']
        verbose_name = 'Видеролик'
        verbose_name_plural = 'Видеролики'
