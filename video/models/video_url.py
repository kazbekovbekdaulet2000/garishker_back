from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.contants import VIDEO_CONVERSION_STATUS_CHOICES, VIDEO_URL_TYPE
from common.custom_model import AbstractModel, ContentTypeModel
from common.yandex_storage import ClientDocsStorage
from django.contrib.postgres.fields import ArrayField
from django.contrib.contenttypes.models import ContentType
from video.models.content_choice import CONTENT_TYPE_CHOICES


class VideoURL(AbstractModel, ContentTypeModel):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, null=True, limit_choices_to={'id__in': CONTENT_TYPE_CHOICES})
    original_quality = models.PositiveBigIntegerField(_('Качество'), null=True)
   
    # used to combine Video with url and video with file (not the best case)
    url = models.URLField(null=True, blank=True)
    video_file = models.FileField(_('Видеофайл'), upload_to='video-file', storage=ClientDocsStorage, null=True, blank=True)

    url_type = models.PositiveIntegerField(choices=VIDEO_URL_TYPE, default='s3')
    convert_status = models.CharField(_('Статус конвертации'), max_length=255, choices=VIDEO_CONVERSION_STATUS_CHOICES, default='pending')
    duriation = models.DurationField(_("Длительность"), blank=True, null=True, default=None)

    def __str__(self):
        return self.url or self.video_file.url.split('?')[0]

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Video'
        verbose_name_plural = 'Video'