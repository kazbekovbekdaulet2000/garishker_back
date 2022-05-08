
from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel, ReactionsAbstract
from obrazovanie.models.category import Category
from obrazovanie.models.common_manager import ReactionManager
from reaction.models.bookmark import Bookmark
from reaction.models.like import Like
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


class Video(AbstractModel, ReactionsAbstract):
    title_ru = models.CharField(_('Название (рус)'), max_length=500, default="", blank=True)
    title_kk = models.CharField(_('Название (каз)'), max_length=500, default="", blank=True)
    body_ru = RichTextUploadingField()
    body_kk = RichTextUploadingField(blank=True)
    image = models.FileField(_('Обложка'), upload_to='video-image', blank=True)
    image_2 = models.FileField(_('Обложка вторая'), upload_to='video-image', blank=True)
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.DO_NOTHING, related_name='video_category')
    video = models.FileField(_('Видео'), upload_to='video-video', storage=ClientDocsStorage, null=True)
    video_name = models.CharField(_('Название видео с расширением)'), max_length=6250, default="")
    youtube = models.CharField(max_length=500, blank=True, null=True)
    original_quality = models.PositiveBigIntegerField(_('Качество'), null=True)
    author = models.ForeignKey(User, on_delete=models.DO_NOTHING, null=True, related_name='video_author')
    views = models.PositiveIntegerField(default=0)
    subs_kk = models.FileField(_('Субтитры (каз)'), storage=ClientDocsStorage, upload_to='subtitles', blank=True)
    convert_status = models.CharField(_('Статус конвертации'), max_length=255, choices=VIDEO_CONVERSION_STATUS_CHOICES, default='pending')
    duriation = models.DurationField(_("Длительность"), blank=True, null=False, default="00:00")
    video_quality = models.ManyToManyField(VideoQuality, related_name='video_qualities')

    objects = ReactionManager()
    
    def __str__(self):
        return self.title_ru

    def increase_views(self):
        self.views += 1
        self.save()

    def set_quality(self, quality):
        self.original_quality = quality
        self.save()
    
    def save(self, **kwargs) -> None:
        if(self.youtube):
            self.convert_status = 'converted'
            self.video_name = ''
        return super().save(**kwargs)

    class Meta:
        ordering = ['-created_at', '-views']
        verbose_name = 'Видеролик'
        verbose_name_plural = 'Видеролики'
