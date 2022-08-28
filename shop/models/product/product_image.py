from django.db import models
from django.utils.translation import gettext_lazy as _
from shop.models.product.product import Product
from common.custom_model import AbstractModel

from utils.image_progressive import create_thumbnail, has_changed

def course_dir(instance, filename):
    return f"products/product_{instance.product.id}/{filename}"


def thumb_dir(instance, filename):
    return f"products/product_{instance.product.id}/thumbs/{filename}"


class ProductImage(AbstractModel):
    image = models.ImageField(verbose_name=_('Фото'), null=False, blank=True, upload_to=course_dir)
    image_thumb480 = models.ImageField(verbose_name=_('Фото (480px)'), upload_to=thumb_dir, max_length=500, null=True, blank=True)
    image_thumb720 = models.ImageField(verbose_name=_('Фото (720px)'), upload_to=thumb_dir, max_length=500, null=True, blank=True)
    image_thumb1080 = models.ImageField(verbose_name=_('Фото (1080px)'), upload_to=thumb_dir, max_length=500, null=True, blank=True)
    product = models.ForeignKey(Product, related_name='images', blank=True, on_delete=models.CASCADE, verbose_name=_('Продукт'))

    def __str__(self):
        return f"{self.product.name_ru}"

    def save(self, *args, **kwargs):
        if (has_changed(self, 'image')):
            self.image_thumb480 = create_thumbnail(self.image_thumb480, 480)
            self.image_thumb720 = create_thumbnail(self.image_thumb720, 720)
            self.image_thumb1080 = create_thumbnail(self.image_thumb1080, 1080)
        force_update = False
        if self.id:
            force_update = True
        super(ProductImage, self).save(force_update=force_update, *args, **kwargs)

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Фото'
        verbose_name_plural = 'Фотографии'