from rest_framework import serializers
from shop.models.product.product_compound import ProductCompound


class ProductCompoundSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductCompound
        fields = ('name_ru', 'name_kk')