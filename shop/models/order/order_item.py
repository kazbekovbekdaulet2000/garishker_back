from django.db import models
from config.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from shop.models.product.product_item import ProductItem
from shop.models.product.product_size import ProductSize


class OrderItem(AbstractModel):
    product = models.ForeignKey(ProductItem, on_delete=models.CASCADE)
    size = models.ForeignKey(ProductSize, on_delete=models.CASCADE)    
    count = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f"{self.product.__str__()} {self.size.__str__()}"

    class Meta:
        ordering=['-created_at']
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'