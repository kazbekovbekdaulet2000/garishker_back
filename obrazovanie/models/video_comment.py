
from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from django.db import models
from config.custom_model import AbstractModel
from obrazovanie.models.report import Report
from obrazovanie.models.video import Video
from user.models import User


class VideoComment(AbstractModel):
    body = models.TextField(blank=False)
    owner = models.ForeignKey(
        User, related_name='video_comments', on_delete=models.CASCADE, null=True)
    video = models.ForeignKey(
        Video, related_name='video_comments', on_delete=models.CASCADE)
    reply = models.ForeignKey('self', related_name='reply_comment',
                              on_delete=models.DO_NOTHING, null=True, blank=True)

    def __str__(self):
        return self.video.title

    class Meta:
        ordering = ['created_at']
        verbose_name = 'Комментарий (видео)'
        verbose_name_plural = 'Комментарии (видео)'
