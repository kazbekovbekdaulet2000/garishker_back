from django.db import models
from django.dispatch import receiver
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.custom_model import AbstractModel, ContentTypeModel, ReactionsAbstract
from shop.models.product.product import Product
from django.conf import settings
from django.core.validators import MaxValueValidator, MinValueValidator

User = settings.AUTH_USER_MODEL


class Review(AbstractModel, ContentTypeModel, ReactionsAbstract):
    body = models.TextField(blank=False)
    owner = models.ForeignKey(User, related_name='review', on_delete=models.CASCADE, null=True)
    rating = models.PositiveIntegerField(null=False, default=5, validators=(MaxValueValidator(5), MinValueValidator(1)))

    def __str__(self):
        return f"{self.owner.get_full_name()} - {self.content_object.__str__()}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Отзыв'
        verbose_name_plural = 'Отзывы'


@receiver(models.signals.post_save, sender=Review)
def create_obj(sender, instance, **kwargs):
    if(kwargs['created']):
        obj = instance.content_object
        if(type(obj) == Product and kwargs['created']):
            user = obj.owner
            user.rating = (user.rating + instance.rating)/2
            user.save()
        try:
            if(not obj.reviews_count == None):
                obj.reviews_count += 1
                obj.save()
        except: pass


@receiver(models.signals.post_delete, sender=Review)
def delete_obj(sender, instance, **kwargs):
    obj = instance.content_object
    try:
        if(not obj.reviews_count == None):
            obj.reviews_count -= 1
            obj.save()
    except: pass
