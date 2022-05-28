from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from shop.models.product.product import Product
from shop.models.product.product_size import ProductSize


class ProductItem(AbstractModel):
    # unique_id = models.CharField(max_length=255, null=True, blank=True, unique=True)
    product = models.ForeignKey(Product, related_name='items', on_delete=models.DO_NOTHING, verbose_name=_('Продукт'))
    size = models.ForeignKey(ProductSize, on_delete=models.CASCADE, blank=True, verbose_name=_('Размер'))
    count = models.PositiveIntegerField(default=10, null=False, verbose_name=_('Количество доступное'))

    def __str__(self):
        return f"{self.product.name_ru}-{self.size.size}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Размер продукта'
        verbose_name_plural = 'Размеры продукта'