
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.conf import settings
from user.models import User

# Категории
class Category(models.Model):
    name = models.CharField(_('Название'), max_length=120)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'


# Разделы
class Section(models.Model):
    name = models.CharField(_('Название'), max_length=120)
    created_date = models.DateTimeField(auto_now_add=True, null=True)
    updated_date = models.DateTimeField(auto_now=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Раздел'
        verbose_name_plural = 'Разделы'


# Статьи
class Report(models.Model):
    title = models.CharField(_('Название'), max_length=500, blank=True)
    body = models.TextField(_('Текст'), blank=True)
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.DO_NOTHING, related_name='report_category', blank=True)
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING, null=True, related_name='report_author', blank=True)
    image = models.FileField(_('Обложка'), upload_to='report-image', blank=True)
    favourite = models.ManyToManyField(settings.AUTH_USER_MODEL, related_name='report_favourite', blank=True)
    moderated = models.BooleanField(default=False, blank=True)
    created_at = models.DateTimeField(auto_now_add=True, blank=True)
    likes = models.ManyToManyField(User, related_name='blog_posts', blank=True)
    read_time = models.IntegerField(null=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Статья'
        verbose_name_plural = 'Статьи'


class Comment(models.Model):

    body = models.TextField(blank=False)
    owner = models.ForeignKey(User, related_name='comments', on_delete=models.CASCADE, null=True)
    report = models.ForeignKey(Report, related_name='comments', on_delete=models.CASCADE)
    reply = models.ForeignKey('self', related_name='reply_comment', on_delete=models.DO_NOTHING, null=True, blank=True)
    date_added = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return '%s - %s' % (self.report.title, self.owner.email)

    class Meta:
        ordering = ['date_added']
        verbose_name = 'Комментарий'
        verbose_name_plural = 'Комментарии'


# Видеролики
class Video(models.Model):
    title = models.CharField(_('Название'), max_length=500)
    body = models.TextField(_('Текст'))
    image = models.FileField(_('Обложка'), upload_to='video-image', blank=True)
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.DO_NOTHING, related_name='video_category')
    section = models.ForeignKey(Section, verbose_name="Раздел", on_delete=models.DO_NOTHING, related_name='video_section')
    video = models.FileField(_('Видео'), upload_to='video-video')
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.DO_NOTHING, null=True, related_name='video_author')
    favourite = models.ManyToManyField(settings.AUTH_USER_MODEL, related_name='video_favourite', blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Видеролик'
        verbose_name_plural = 'Видеролики'
