from rest_framework import generics
from shop.models.order.order import Order
from shop.serializers.order.order_serializer import OrderCreateSerializer


class CreateOrderView(generics.CreateAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderCreateSerializer