from rest_framework import serializers
from shop.models.product.product import Product
from shop.serializers.product_compound_serializer import ProductCompoundSerializer
from shop.serializers.product_image_serializer import ProductImageSerializer
from shop.serializers.product_item_serializer import ProductItemSerializer


class ProductSerializer(serializers.ModelSerializer):
    images = ProductImageSerializer(many=True, read_only=True)

    class Meta:
        model = Product
        fields = ('id', 'name_ru', 'name_kk', 'price',
                  'g_token_price',  'discount', 'images',
                  'likes_count', 'reviews_count', 'bookmarks_count')


class ProductDetailSerializer(ProductSerializer):
    compound = ProductCompoundSerializer(many=True)

    class Meta:
        model = Product
        fields = ProductSerializer.Meta.fields + \
            ('description_ru', 'description_kk', 'care_ru', 'care_kk', 'compound')
