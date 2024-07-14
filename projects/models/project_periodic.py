from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from ckeditor_uploader.fields import RichTextUploadingField
from payment.models.donation_project import Donation
from projects.models.const import YEAR_CHOICES, PROJECT_STATUS
from projects.models.project import Project
from video.models.video_url import VideoURL
from datetime import datetime


class ProjectPeriod(AbstractModel):
    project = models.ForeignKey(Project, on_delete=models.CASCADE, related_name='children')
    name_kk = models.CharField(_('Название (каз)'), max_length=255)
    name_ru = models.CharField(_('Название (рус)'), max_length=255)
    description_kk = RichTextUploadingField(verbose_name=_('Описание (каз)'))
    description_ru = RichTextUploadingField(verbose_name=_('Описание (рус)'))
    year = models.PositiveIntegerField(choices=YEAR_CHOICES, default=datetime.now().year, null=False)
    status = models.CharField(choices=PROJECT_STATUS, default='in_process', max_length=16, null=False)
    donat = models.ForeignKey(Donation, on_delete=models.DO_NOTHING, null=True, blank=True)
    video = models.ForeignKey(VideoURL, on_delete=models.DO_NOTHING, null=True, blank=True)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-year', '-created_at']
        verbose_name = 'Проект (годы)'
        verbose_name_plural = 'Проекты (по годам)'