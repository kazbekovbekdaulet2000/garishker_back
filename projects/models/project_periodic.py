from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from ckeditor_uploader.fields import RichTextUploadingField
from django.db import models
from datetime import datetime
from projects.models.const import YEAR_CHOICES, PROJECT_STATUS
from projects.models.project import Project


class ProjectPeriod(AbstractModel):
    project = models.ForeignKey(Project, on_delete=models.CASCADE, related_name='children')
    name_kk = models.CharField(_('Название (каз)'), max_length=255)
    name_ru = models.CharField(_('Название (рус)'), max_length=255)
    description_kk = RichTextUploadingField(verbose_name=_('Описание (каз)'))
    description_ru = RichTextUploadingField(verbose_name=_('Описание (рус)'))

    required_amount = models.PositiveIntegerField(verbose_name=_('Нужно собрать'))
    collected_amount = models.PositiveIntegerField(verbose_name=_('Собрано'))

    year = models.PositiveIntegerField(choices=YEAR_CHOICES, default=datetime.now().year, null=False)
    status = models.CharField(choices=PROJECT_STATUS, default='in_process', max_length=16, null=False)
    unique_id = models.CharField(verbose_name=_('Униакальное название'), max_length=255, unique=True)
    
    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Проект (годы)'
        verbose_name_plural = 'Проекты (по годам)'

# def update_course(sender, instance, created, **kwargs):
#     period = instance.course

# post_save.connect(update_course, sender=ProjectPeriod)