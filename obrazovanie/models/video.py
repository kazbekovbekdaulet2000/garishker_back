from django.db import models
from django.utils.translation import gettext_lazy as _
from common.contants import LANGS
from common.custom_model import AbstractModel, ReactionsAbstract
from obrazovanie.models.category import Category
from obrazovanie.models.common_manager import ReactionManager
from user.models import User
from ckeditor_uploader.fields import RichTextUploadingField
from common.yandex_storage import ClientDocsStorage
from django.contrib.postgres.fields import ArrayField
from utils.image_progressive import create_thumbnail, has_changed
from video.models.video_url import VideoURL


class Video(AbstractModel, ReactionsAbstract):
    title_ru = models.CharField(_('Название (рус)'), max_length=500, default="", blank=True)
    title_kk = models.CharField(_('Название (каз)'), max_length=500, default="", blank=True)
    body_ru = RichTextUploadingField()
    body_kk = RichTextUploadingField(blank=True)
    image = models.FileField(_('Обложка'), upload_to='video-image', blank=True)
    image_2 = models.FileField(_('Обложка вторая'), upload_to='video-image', blank=True)
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.DO_NOTHING, related_name='video_category')
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
    
    def save(self, **kwargs) -> None:
        if (has_changed(self, 'image')):
            self.image = create_thumbnail(self.image, 720)
        if (has_changed(self, 'image_2')):
            self.image_2 = create_thumbnail(self.image_2, 720)
        return super().save(**kwargs)

    class Meta:
        ordering = ['-created_at', '-views']
        verbose_name = 'Видеролик'
        verbose_name_plural = 'Видеролики'
