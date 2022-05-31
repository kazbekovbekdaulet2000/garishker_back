from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from shop.models.order.user_bag import UserBag
from shop.models.product.product import Product
from shop.models.product.product_size import ProductSize


class UserBagItem(AbstractModel):
    order = models.ForeignKey(UserBag, related_name='products', on_delete=models.CASCADE)
    count = models.PositiveIntegerField(default=1)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    size = models.ForeignKey(ProductSize, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.order.id}: {self.product.__str__()} {self.size.__str__()}"

    class Meta:
        ordering=['-created_at']
