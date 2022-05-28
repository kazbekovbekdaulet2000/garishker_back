from django.db import models
from django.dispatch import receiver
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.custom_model import AbstractModel, ContentTypeModel
from django.conf import settings

User = settings.AUTH_USER_MODEL


class Bookmark(AbstractModel, ContentTypeModel):
    owner = models.ForeignKey(User, related_name='bookmarks', on_delete=models.CASCADE, null=True)

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Сохранение'
        verbose_name_plural = 'Сохранения'


@receiver(models.signals.post_save, sender=Bookmark)
def create_obj(sender, instance, **kwargs):
    if(kwargs['created']):
        obj = instance.content_object
        try:
            obj.bookmarks_count += 1
            obj.save()
        except AttributeError:
            pass


@receiver(models.signals.post_delete, sender=Bookmark)
def delete_obj(sender, instance, **kwargs):
    obj = instance.content_object
    try:
        obj.bookmarks_count -= 1
        obj.save()
    except AttributeError:
        pass
