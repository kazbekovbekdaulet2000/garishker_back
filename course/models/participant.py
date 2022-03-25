from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from config.custom_model import AbstractModel
from user.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from django.core.validators import MaxValueValidator, MinValueValidator


class Participant(AbstractModel):
    user = models.ForeignKey(User, related_name='participation', on_delete=models.CASCADE, null=False, default=1)
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, null=True)
    object_id = models.PositiveIntegerField(null=True)
    content_object = GenericForeignKey('content_type', 'object_id')
    points = models.PositiveIntegerField(default=0, validators=[MaxValueValidator(20), MinValueValidator(0)])
    success = models.BooleanField(default=False)
    
    def __str__(self):
        return self.user.email

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Участник'
        verbose_name_plural = 'Участники'
