from django.db import models
from config.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
import uuid


class UserBag(AbstractModel):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    
    def __str__(self):
        return f"{self.id}"

    class Meta:
        ordering = ['-created_at']
