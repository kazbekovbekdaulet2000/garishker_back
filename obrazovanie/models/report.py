
from bs4 import BeautifulSoup
import datetime
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.conf import settings
from config.custom_model import AbstractModel
from obrazovanie.models.category import Category
from user.models import User
from ckeditor_uploader.fields import RichTextUploadingField


class Report(AbstractModel):
    title = models.CharField(_('Название'), max_length=500, blank=True)
    body = RichTextUploadingField()
    category = models.ForeignKey(Category, verbose_name="Категория",
                                 on_delete=models.DO_NOTHING, related_name='report_category', blank=True)
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING,
                               null=True, related_name='report_author', blank=True)
    image = models.FileField(
        _('Обложка'), upload_to='report-image', blank=True)
    saves = models.ManyToManyField(
        settings.AUTH_USER_MODEL, related_name='report_saves', blank=True)
    moderated = models.BooleanField(default=False, blank=True)
    likes = models.ManyToManyField(
        User, related_name='report_likes', blank=True)
    views = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.title

    def increase_views(self):
        self.views += 1
        self.save()

    def get_reading_time(self):
        soup = BeautifulSoup(self.body, 'html.parser')
        text = soup.get_text()
        word_count = len(text.split())
        read_time = word_count / 100
        read_time = str(datetime.timedelta(minutes=read_time))
        return read_time

    class Meta:
        ordering = ['-created_at', '-views']
        verbose_name = 'Статья'
        verbose_name_plural = 'Статьи'
