from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from config.custom_model import AbstractModel
from user.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey


class Participant(AbstractModel):
    user = models.ForeignKey(User, related_name='participation',
                             on_delete=models.CASCADE, null=True)
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE,
                                     null=True)
    object_id = models.PositiveIntegerField(null=True)
    content_object = GenericForeignKey('content_type', 'object_id')

    def __str__(self):
        return self.body

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Участник'
        verbose_name_plural = 'Участники'
