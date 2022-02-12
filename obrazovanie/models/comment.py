from django.db import models
from django.utils.translation import gettext_lazy as _
from config.custom_model import AbstractModel
from django.db import models
from config.custom_model import AbstractModel
from user.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey


class Comment(AbstractModel):
    body = models.TextField(blank=False)
    owner = models.ForeignKey(
        User, related_name='comments2', on_delete=models.CASCADE, null=True)
    reply = models.ForeignKey('self', related_name='reply_comment',
                              on_delete=models.DO_NOTHING, null=True, blank=True)
    content_type = models.ForeignKey(
        ContentType, on_delete=models.CASCADE, null=True)
    object_id = models.PositiveIntegerField(null=True)
    content_object = GenericForeignKey('content_type', 'object_id')
    likes = models.ManyToManyField(
        User, related_name='comment_likes', blank=True, default=[])

    def __str__(self):
        return self.body

    class Meta:
        ordering = ['created_at']
        verbose_name = 'Комментарий'
        verbose_name_plural = 'Комментарии'
