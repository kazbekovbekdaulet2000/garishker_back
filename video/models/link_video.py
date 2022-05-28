from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.contants import VIDEO_CONVERSION_STATUS_CHOICES
from common.custom_model import AbstractModel, ContentTypeModel
from common.yandex_storage import ClientDocsStorage
from django.contrib.postgres.fields import ArrayField


VIDEO_URL_TYPE = (
  (0, 'html'),
  (1, 'youtube'),
  (2, 'vimeo'),
  (3, 'other')
)

class VideoURL(AbstractModel, ContentTypeModel):
    videofile_name = models.FileField(_('Видеофайл'), upload_to='video-file', storage=ClientDocsStorage, null=True)
    original_quality = models.PositiveBigIntegerField(_('Качество'), null=True)
    url = models.URLField(null=False, blank=True)
    url_type = models.PositiveIntegerField(choices=VIDEO_URL_TYPE, default='youtube')
    convert_status = models.CharField(_('Статус конвертации'), max_length=255, choices=VIDEO_CONVERSION_STATUS_CHOICES, default='pending')
    duriation = models.DurationField(_("Длительность"), blank=True, null=True, default=None)
    thumbs = ArrayField(base_field=models.FileField(_('thumbs'), upload_to='video-file/thumbs', storage=ClientDocsStorage, null=True))

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'VideoFile'
        verbose_name_plural = 'VideoFiles'
