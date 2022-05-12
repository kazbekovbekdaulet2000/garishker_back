from rest_framework import serializers
from shop.models.product.product_item import ProductItem


class ProductItemSerializer(serializers.ModelSerializer):
    size = serializers.SerializerMethodField(read_only=True)

    def get_size(self, obj) -> str:
        return obj.size.size_global

    class Meta:
        model = ProductItem
        fields = ('id', 'size', )