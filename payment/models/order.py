from django.db import models
from common.custom_model import AbstractModel, ContentTypeModel, User
from django.contrib.contenttypes.models import ContentType
from event.models.event import Event
from obrazovanie.models.video import Video
from obrazovanie.models.report import Report
from projects.models.project_periodic import ProjectPeriod
from django.utils.translation import gettext_lazy as _

DONATION_CHOICES = (
    ContentType.objects.get_for_model(Video).id,
    ContentType.objects.get_for_model(Report).id,
    ContentType.objects.get_for_model(Event).id,
    ContentType.objects.get_for_model(ProjectPeriod).id
)


class DonationOrder(AbstractModel, ContentTypeModel):
    order_id = models.CharField(max_length=255)
    client = models.ForeignKey(User, on_delete=models.DO_NOTHING, related_name="donations", blank=True, null=True)
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, null=True, limit_choices_to={'id__in': DONATION_CHOICES})
    object_id = models.PositiveIntegerField(_("Id элемента"), null=True)
    amount = models.IntegerField(default=100)

    class Meta:
        verbose_name = 'Донат 2'
        verbose_name_plural = 'Донаты 2'
