from rest_framework import generics
from rest_framework import permissions
from obrazovanie.models.category import Category
from obrazovanie.serializers.categorty_serizializers import CategorySerializer


class CategoryList(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    permission_classes = [permissions.AllowAny, ]
    pagination_class = None
