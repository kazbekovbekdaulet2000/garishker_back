from re import L
from rest_framework import generics
from rest_framework import permissions
from shop.models.product import Product
from shop.serializers.product_serializer import ProductDetailSerializer, ProductSerializer


class ProductList(generics.ListAPIView):
    permission_classes = [permissions.AllowAny, ]
    serializer_class = ProductSerializer
    queryset = Product.objects.filter(active=True)


class ProductDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    permission_classes = [permissions.AllowAny, ]
    serializer_class = ProductDetailSerializer
    queryset = Product.objects.filter(active=True)