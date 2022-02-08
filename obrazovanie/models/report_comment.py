
from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from django.db import models
from config.custom_model import AbstractModel
from obrazovanie.models.report import Report
from user.models import User


class Comment(AbstractModel):
    body = models.TextField(blank=False)
    owner = models.ForeignKey(
        User, related_name='comments', on_delete=models.CASCADE, null=True)
    report = models.ForeignKey(
        Report, related_name='comments', on_delete=models.CASCADE)
    reply = models.ForeignKey('self', related_name='reply_comment',
                              on_delete=models.DO_NOTHING, null=True, blank=True)

    def __str__(self):
        return self.report.title

    class Meta:
        ordering = ['created_at']
        verbose_name = 'Комментарий (cтатьи)'
        verbose_name_plural = 'Комментарии (cтатьи)'