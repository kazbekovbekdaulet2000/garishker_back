
from bs4 import BeautifulSoup
import datetime
from django.db import models
from django.utils.translation import gettext_lazy as _
from common.contants import LANGS
from common.custom_model import AbstractModel, ReactionsAbstract
from obrazovanie.models.category import Category
from obrazovanie.models.common_manager import ReactionManager
from user.models import User
from ckeditor_uploader.fields import RichTextUploadingField
from django.contrib.postgres.fields import ArrayField


class Report(AbstractModel, ReactionsAbstract):
    title_ru = models.CharField(_('Название (рус)'), max_length=500, blank=True)
    title_kk = models.CharField(_('Название (каз)'), max_length=500, blank=True)
    preview_text_ru = models.TextField(_('Короткое описание (рус)'), max_length=1500, blank=True)
    preview_text_kk = models.TextField(_('Короткое описание (каз)'), max_length=1500, blank=True)
    body_ru = RichTextUploadingField()
    body_kk = RichTextUploadingField(blank=True)
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.DO_NOTHING, related_name='report_category', blank=True)
    author = models.ForeignKey(User, on_delete=models.DO_NOTHING, null=True, related_name='report_author', blank=True)
    image = models.FileField(_('Обложка'), upload_to='report-image', blank=True)
    moderated = models.BooleanField(default=False, blank=True)
    views = models.PositiveIntegerField(default=0)
    read_time = models.CharField(max_length=255, null=True, blank=True)

    languages = ArrayField(base_field=models.CharField(max_length=3), default=LANGS)

    objects = ReactionManager()

    def __str__(self):
        return self.title_ru

    def increase_views(self):
        self.views += 1
        self.save()

    def get_reading_time(self):
        soup = BeautifulSoup(self.body_ru, 'html.parser')
        text = soup.get_text()
        word_count = len(text.split())
        read_time = word_count / 100
        read_time = str(datetime.timedelta(minutes=read_time))
        return read_time

    def save(self) -> None:
        self.read_time = self.get_reading_time()
        return super().save()

    class Meta:
        ordering = ['-created_at', '-views']
        verbose_name = 'Статья'
        verbose_name_plural = 'Статьи'