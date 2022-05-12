import os
import sys
from django.db import models
from django.utils.translation import gettext_lazy as _
from shop.models.product.product import Product
from PIL import Image
from config.custom_model import AbstractModel
from django.core.files.uploadedfile import InMemoryUploadedFile
from io import BytesIO

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

    def create_thumbnail(self, newsize) -> InMemoryUploadedFile:
        if not self.image:
            return
        data_img = BytesIO()

        img = Image.open(self.image)
        img = img.convert('RGB')
        if(img.height/newsize <= 1 or img.width/newsize <= 1):
            return None

        if(img.width > img.height):
            width = int(newsize)
            height = int(img.height/(img.width/newsize))
        else:
            height = int(newsize)
            width = int(img.width/(img.height/newsize))

        THUMBNAIL_SIZE = (width, height)
        img.thumbnail(THUMBNAIL_SIZE, Image.ANTIALIAS)
        img.save(data_img, format='jpeg', quality=100)

        return InMemoryUploadedFile(data_img,
                                    'ImageField',
                                    '%s_thumbnail_%spx.%s' % (os.path.splitext(
                                        self.image.name)[0], int(newsize), 'jpeg'),
                                    'jpeg',
                                    sys.getsizeof(data_img), None)

    def save(self, *args, **kwargs):
        if(not self.image_thumb480):
            self.image_thumb480 = self.create_thumbnail(480)
        if(not self.image_thumb720):
            self.image_thumb720 = self.create_thumbnail(720)
        if(not self.image_thumb1080):
            self.image_thumb1080 = self.create_thumbnail(1080)
            self.image = self.create_thumbnail(1080)
        force_update = False
        if self.id:
            force_update = True
        super(ProductImage, self).save(force_update=force_update, *args, **kwargs)

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Фото'
        verbose_name_plural = 'Фотографии'