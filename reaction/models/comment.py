from django.db import models
from django.dispatch import receiver
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel, ContentTypeModel, ReactionsAbstract
from django.conf import settings

User = settings.AUTH_USER_MODEL

class Comment(AbstractModel, ContentTypeModel, ReactionsAbstract):
    body = models.TextField(blank=False)
    owner = models.ForeignKey(User, related_name='comments', on_delete=models.CASCADE, null=True)
    reply = models.ForeignKey('self', related_name='comments_reply', on_delete=models.DO_NOTHING, null=True, blank=True)

    def __str__(self):
        return f"{self.owner.get_full_name()} - {self.content_object.__str__()}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Комментарий'
        verbose_name_plural = 'Комментарии'


@receiver(models.signals.post_save, sender=Comment)
def create_obj(sender, instance, **kwargs):
    if(kwargs['created']):
        obj = instance.content_object
        if(not obj.comments_count == None):
            obj.comments_count += 1
            obj.save()


@receiver(models.signals.post_delete, sender=Comment)
def delete_obj(sender, instance, **kwargs):
    obj = instance.content_object
    if(not obj.comments_count == None):
        obj.comments_count -= 1
        obj.save()
