from django.forms import ValidationError
from rest_framework import serializers
from shop.models.order.order import Order
from shop.models.order.order_item import OrderItem
from shop.models.product.product_item import ProductItem


class ProductOrderCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItem
        exclude = ('order',)


class OrderCreateSerializer(serializers.ModelSerializer):
    products = ProductOrderCreateSerializer(many=True)

    class Meta:
        model = Order
        fields = ('id', 'name', 'email', 'phone', 'address', 'city', 'post_id', 'delivery_type', 'products')

    def validate(self, attrs):
        products_attrs = attrs['products']
        for product in products_attrs:
            if(not ProductItem.objects.filter(size=product['size'], product=product['product']).exists()):
                raise ValidationError('Таких данных нету на складе')
        return super().validate(attrs)

    def create(self, validated_data):
        products = validated_data.pop('products')
        validated_data['total_sum'] = 0
        order = Order.objects.create(**validated_data)
        full_price = 0
        discount_price = 0
        for product in products:
            prod = OrderItem.objects.create(order=order, **product)
            full_price += prod.product.price * product['count'] * 100
            discount_price += prod.product.price * product['count'] * (100 - prod.product.discount)
        order.total_sum = full_price
        order.total_discount_sum = discount_price
        order.save()
        return order