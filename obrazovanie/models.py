from django.db import models
from django.utils.translation import ugettext_lazy as _


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

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Раздел'
        verbose_name_plural = 'Разделы'


# Статьи
class Report(models.Model):
    title = models.CharField(_('Название'), max_length=500)
    body = models.TextField(_('Текст'))
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.DO_NOTHING, related_name='report_category')
    # author = models.ForeignKey(User, on_delete=models.DO_NOTHING, related_name='report_author')
    image = models.FileField(_('Обложка'), upload_to='report-image')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Статья'
        verbose_name_plural = 'Статьи'


# Видеролики
class Video(models.Model):
    title = models.CharField(_('Название'), max_length=500)
    body = models.TextField(_('Текст'))
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.DO_NOTHING, related_name='video_category')
    section = models.ForeignKey(Section, verbose_name="Раздел", on_delete=models.DO_NOTHING, related_name='video_section')
    video = models.FileField(_('Видео'), upload_to='video-image')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Видеролик'
        verbose_name_plural = 'Видеролики'
