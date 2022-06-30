from django.db import models
from common.custom_model import AbstractModel, ContentTypeModel
from django.contrib.contenttypes.models import ContentType
from event.models.event import Event
from obrazovanie.models.video import Video
from obrazovanie.models.report import Report
from projects.models.project_periodic import ProjectPeriod
from django.utils.translation import gettext_lazy as _
from django.contrib.postgres.fields import ArrayField
from ckeditor_uploader.fields import RichTextUploadingField

DONATION_CHOICES = (
    ContentType.objects.get_for_model(Video).id,
    ContentType.objects.get_for_model(Report).id,
    ContentType.objects.get_for_model(Event).id,
    ContentType.objects.get_for_model(ProjectPeriod).id
)


class Donation(AbstractModel, ContentTypeModel):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, null=True, blank=True, limit_choices_to={'id__in': DONATION_CHOICES})
    object_id = models.PositiveIntegerField(_("Id элемента"), null=True)
    default_options = ArrayField(base_field=models.IntegerField(), default=[1000, 2000, 5000, 10000, 20000])
    title_kk = models.CharField(max_length=255, null=True, blank=True)
    title_ru = models.CharField(max_length=255, null=True, blank=True)
    description_kk = RichTextUploadingField(null=True, blank=True)
    description_ru = RichTextUploadingField(null=True, blank=True)

    class Meta:
        verbose_name = 'Донат'
        verbose_name_plural = 'Донаты'
