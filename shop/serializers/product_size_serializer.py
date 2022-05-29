from rest_framework import serializers
from shop.models.product.product_size import ProductSize


class ProductSizeSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductSize
        fields = ('id', 'size', 'size_global')