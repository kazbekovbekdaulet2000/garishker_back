import os
import sys
from django.db import models
from django.utils.translation import gettext_lazy as _
from common.contants import LANGS, VIDEO_CONVERSION_STATUS_CHOICES
from common.custom_model import AbstractModel, ReactionsAbstract
from obrazovanie.models.category import Category
from obrazovanie.models.common_manager import ReactionManager
from user.models import User
from ckeditor_uploader.fields import RichTextUploadingField
from common.yandex_storage import ClientDocsStorage
from django.contrib.postgres.fields import ArrayField
from PIL import Image
from django.core.files.uploadedfile import InMemoryUploadedFile
from io import BytesIO

from video.models.video_url import VideoURL


class Video(AbstractModel, ReactionsAbstract):
    title_ru = models.CharField(_('Название (рус)'), max_length=500, default="", blank=True)
    title_kk = models.CharField(_('Название (каз)'), max_length=500, default="", blank=True)
    body_ru = RichTextUploadingField()
    body_kk = RichTextUploadingField(blank=True)
    image = models.FileField(_('Обложка'), upload_to='video-image', blank=True)
    image_2 = models.FileField(_('Обложка вторая'), upload_to='video-image', blank=True)
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.DO_NOTHING, related_name='video_category')
    original_quality = models.PositiveBigIntegerField(_('Качество'), null=True)
    author = models.ForeignKey(User, on_delete=models.DO_NOTHING, null=True, related_name='video_author')
    views = models.PositiveIntegerField(default=0)
    subs_kk = models.FileField(_('Субтитры (каз)'), storage=ClientDocsStorage, upload_to='subtitles', blank=True)
    duriation = models.DurationField(_("Длительность"), blank=True, null=False, default="00:00")
    tags = ArrayField(base_field=models.CharField(max_length=255), default=list, null=True, blank=True)
    languages = ArrayField(base_field=models.CharField(max_length=3), default=list(dict(LANGS).keys()))
    video = models.ForeignKey(VideoURL, on_delete=models.DO_NOTHING, null=True, blank=True)
    
    objects = ReactionManager()
    
    def __str__(self):
        return self.title_ru

    def increase_views(self):
        self.views += 1
        self.save()

    def set_quality(self, quality):
        self.original_quality = quality
        self.save()
    
    def create_thumbnail(self, newsize) -> InMemoryUploadedFile:
        if not self.image:
            return
        data_img = BytesIO()

        img = Image.open(self.image)
        img = img.convert('RGB')
        THUMBNAIL_SIZE = (newsize, newsize)
        img.thumbnail(THUMBNAIL_SIZE, Image.ANTIALIAS)
        img.save(data_img, format='jpeg', quality=100)

        return InMemoryUploadedFile(data_img, 'ImageField', '%s.%s' % (os.path.splitext(self.image.name)[0], 'jpeg'), 'jpeg', sys.getsizeof(data_img), None)


    def save(self, **kwargs) -> None:
        return super().save(**kwargs)

    class Meta:
        ordering = ['-created_at', '-views']
        verbose_name = 'Видеролик'
        verbose_name_plural = 'Видеролики'
