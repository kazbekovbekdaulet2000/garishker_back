from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.custom_model import AbstractModel
from video.models.video_url import VideoURL


class VideoQualityURL(AbstractModel):
    url = models.URLField(null=False, blank=True, max_length=4096) # unique=True
    quality = models.PositiveIntegerField(null=False, blank=True)
    video = models.ForeignKey(VideoURL,related_name="qualities", on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.video.__str__()} - {self.quality}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'VideoQualityURL'
        verbose_name_plural = 'VideoQualityURL'
