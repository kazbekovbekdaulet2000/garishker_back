from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.contants import LANGS
from common.custom_model import AbstractModel, ReactionsAbstract
from obrazovanie.models.category import Category
from organizations.models import Organization
from video.models.video_url import VideoURL
from django.contrib.postgres.fields import ArrayField


class Course(AbstractModel, ReactionsAbstract):
    name_kk = models.CharField(_('Название (каз)'), max_length=255, null=False)
    name_ru = models.CharField(_('Название (рус)'), max_length=255, null=False)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    duriation = models.DurationField(_("Длительность курса"), blank=True, null=False, default="7 00:00:00")
    organization = models.ForeignKey(Organization, on_delete=models.CASCADE, null=True)
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.DO_NOTHING, related_name='course_category', blank=True)
    to_view = models.BooleanField(_('Доступна для показа'), default=False)
    views = models.PositiveIntegerField(default=0)
    image = models.FileField(_('Обложка'), upload_to='course-image', blank=True)
    teaser = models.ForeignKey(VideoURL, on_delete=models.DO_NOTHING, null=True, blank=True)
    lesson_count = models.PositiveIntegerField(default=0)
    languages = ArrayField(base_field=models.CharField(max_length=3), default=list(dict(LANGS).keys()))

    def __str__(self):
        return self.name_ru

    def increase_views(self):
        self.views += 1
        self.save()

    def get_first_lesson(self):
        queryset = self.lessons.order_by('order')
        if(queryset.exists()):
            return queryset.first()
        else: 
            return None

    class Meta:
        ordering = ['-created_at']
        verbose_name = '[1] Курс'
        verbose_name_plural = '[1] Курсы'
