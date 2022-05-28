from rest_framework import generics
from rest_framework import permissions
from shop.filters import ProductFilter
from shop.models.product.product import Product
from shop.models.product.product_item import ProductItem
from shop.serializers.product_item_serializer import ProductItemSerializer
from shop.serializers.product_serializer import ProductDetailSerializer, ProductSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter


class ProductList(generics.ListAPIView):
    permission_classes = [permissions.AllowAny, ]
    serializer_class = ProductSerializer
    queryset = Product.objects.filter(active=True)
    search_fields = ('product__name_kk', 'product__name_ru')
    filter_backends = [DjangoFilterBackend, SearchFilter]
    filterset_class = ProductFilter


class ProductSizeList(generics.ListAPIView):
    lookup_field = 'id'
    permission_classes = [permissions.AllowAny, ]
    serializer_class = ProductItemSerializer
    pagination_class = None
    
    def get_queryset(self):
        return ProductItem.objects.filter(product_id=self.kwargs[self.lookup_field])


class ProductDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    permission_classes = [permissions.AllowAny, ]
    serializer_class = ProductDetailSerializer
    queryset = Product.objects.filter(active=True)


class ProductBookmarked(generics.ListAPIView):
    serializer_class = ProductSerializer
    permission_classes = [permissions.IsAuthenticated, ]
    
    def get_queryset(self):
        return Product.objects.list_bookmarked(self.request.user)


class ProductLiked(generics.ListAPIView):
    serializer_class = ProductSerializer
    permission_classes = [permissions.IsAuthenticated, ]

    def get_queryset(self):
        return Product.objects.list_liked(self.request.user)