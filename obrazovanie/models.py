
from bs4 import BeautifulSoup
import datetime
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.conf import settings
from config.custom_model import AbstractModel
from user.models import User
from ckeditor.fields import RichTextField


# Категории
class Category(AbstractModel):
    name = models.CharField(_('Название'), max_length=120)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'


# Статьи
class Report(AbstractModel):
    title = models.CharField(_('Название'), max_length=500, blank=True)
    body = RichTextField()
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

    def __str__(self):
        return self.title

    def get_reading_time(self):
        soup = BeautifulSoup(self.body, 'html.parser')
        text = soup.get_text()
        word_count = len(text.split())
        read_time = word_count / 100
        read_time = str(datetime.timedelta(minutes=read_time))
        return read_time

    class Meta:
        verbose_name = 'Статья'
        verbose_name_plural = 'Статьи'


class Comment(AbstractModel):
    body = models.TextField(blank=False)
    owner = models.ForeignKey(
        User, related_name='comments', on_delete=models.CASCADE, null=True)
    report = models.ForeignKey(
        Report, related_name='comments', on_delete=models.CASCADE)
    reply = models.ForeignKey('self', related_name='reply_comment',
                              on_delete=models.DO_NOTHING, null=True, blank=True)

    def __str__(self):
        return self.report.title

    class Meta:
        ordering = ['created_at']
        verbose_name = 'Комментарий (cтатьи)'
        verbose_name_plural = 'Комментарии (cтатьи)'


# Видеролики
class Video(AbstractModel):
    title = models.CharField(_('Название'), max_length=500)
    body = RichTextField()
    image = models.FileField(_('Обложка'), upload_to='video-image', blank=True)
    category = models.ForeignKey(Category, verbose_name="Категория",
                                 on_delete=models.DO_NOTHING, related_name='video_category')
    video = models.FileField(_('Видео'), upload_to='video-video')
    author = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING, null=True, related_name='video_author')
    saves = models.ManyToManyField(
        settings.AUTH_USER_MODEL, related_name='video_saves', blank=True)
    likes = models.ManyToManyField(
        User, related_name='video_likes', blank=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Видеролик'
        verbose_name_plural = 'Видеролики'


class VideoComment(AbstractModel):
    body = models.TextField(blank=False)
    owner = models.ForeignKey(
        User, related_name='video_comments', on_delete=models.CASCADE, null=True)
    video = models.ForeignKey(
        Video, related_name='video_comments', on_delete=models.CASCADE)
    reply = models.ForeignKey('self', related_name='reply_comment',
                              on_delete=models.DO_NOTHING, null=True, blank=True)

    def __str__(self):
        return self.video.title

    class Meta:
        ordering = ['created_at']
        verbose_name = 'Комментарий (видео)'
        verbose_name_plural = 'Комментарии (видео)'
