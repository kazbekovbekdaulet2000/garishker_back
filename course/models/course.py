from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.custom_model import AbstractModel, ReactionsAbstract
from common.yandex_storage import ClientDocsStorage
from course.models.lector import Lector
from obrazovanie.models.category import Category
from organizations.models import Organization


def course_teaser_dir(instance, filename):
    return f"course/course_{instance.id}/teaser/{filename}"


class Course(AbstractModel, ReactionsAbstract):
    name_kk = models.CharField(_('Название (каз)'), max_length=255, null=False)
    name_ru = models.CharField(_('Название (рус)'), max_length=255, null=False)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    duriation = models.DurationField(_("Длительность курса"), blank=True, null=False, default="7 00:00:00")
    organization = models.ForeignKey(Organization, on_delete=models.CASCADE, null=True)
    lectors = models.ManyToManyField(Lector, blank=True, editable=False)
    category = models.ForeignKey(Category, verbose_name="Категория", on_delete=models.DO_NOTHING, related_name='course_category', blank=True)
    to_view = models.BooleanField(_('Доступна для показа'), default=False)
    views = models.PositiveIntegerField(default=0)
    teaser = models.FileField(_('Тизер'), upload_to=course_teaser_dir, blank=True, storage=ClientDocsStorage, null=True)
    image = models.FileField(_('Обложка'), upload_to='course-image', blank=True)
    rating = models.DecimalField(_('Оценка'), max_digits=3, decimal_places=2, default=0)
    lesson_count = models.PositiveIntegerField(default=0)

    def __str__(self):
        return self.name_ru

    def increase_views(self):
        self.views += 1
        self.save()

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Курс'
        verbose_name_plural = 'Курсы'
