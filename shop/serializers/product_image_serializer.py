from rest_framework import serializers

from shop.models.product.product_image import ProductImage


class ProductImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductImage
        fields = ('image_thumb480', 'image_thumb720', 'image_thumb1080')
