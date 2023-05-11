from django.db import models
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel
from common.s3_storage import S3Storage
from projects.models.project_periodic import ProjectPeriod


class ProjectResource(AbstractModel):
    name_kk = models.CharField(_('Название (каз)'), max_length=255, null=False)
    name_ru = models.CharField(_('Название (рус)'), max_length=255, null=False)
    project = models.ForeignKey(ProjectPeriod, on_delete=models.CASCADE, null=True, blank=True, related_name='resources')
    file = models.FileField(_('Файл'), upload_to='projects-resourses', blank=True, storage=S3Storage)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Ресурс (проект)'
        verbose_name_plural = 'Ресурсы (проект)'
