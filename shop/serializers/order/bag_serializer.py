from itertools import product
from rest_framework import serializers
from shop.models.order.user_bag import UserBag
from shop.models.order.user_bag_item import UserBagItem
from shop.serializers.product_serializer import ProductSerializer
from shop.serializers.product_size_serializer import ProductSizeSerializer


class UserBagItemSerializer(serializers.ModelSerializer):
    product = ProductSerializer(read_only=True)
    size = ProductSizeSerializer(read_only=True)

    class Meta:
        model = UserBagItem
        fields = ('id', 'product', 'count', 'size')


class UserBagItemCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserBagItem
        fields = ('id', 'product', 'count', 'size')

    def validate(self, attrs):
        if(self.context['request'].method == "POST"):
            product_id = attrs['product'].id
        else:
            product_id = self.context['view'].kwargs['id']
        if(UserBagItem.objects.filter(
            order_id=self.context['view'].kwargs['uuid'],
            product_id=product_id
        ).exists()):
            raise serializers.ValidationError({'product': 'already exists'})
        return super().validate(attrs)

    def create(self, validated_data):
        validated_data['order_id'] = self.context['view'].kwargs['uuid']
        return super().create(validated_data)


class UserBagSerializer(serializers.ModelSerializer):
    products = UserBagItemSerializer(many=True)

    class Meta:
        model = UserBag
        fields = ('id', 'products')


class UserBagCreateSerializer(serializers.ModelSerializer):
    products = UserBagItemSerializer(many=True, read_only=True)

    class Meta:
        model = UserBag
        fields = "__all__"
