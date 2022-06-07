from django.contrib.contenttypes.models import ContentType
from event.models.event import Event
from obrazovanie.models.video import Video
from obrazovanie.models.report import Report


CONTENT_TYPE_CHOICES = (
  ContentType.objects.get_for_model(Video).id,
  ContentType.objects.get_for_model(Report).id,
  ContentType.objects.get_for_model(Event).id,
)