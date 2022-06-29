from rest_framework import generics
from rest_framework import permissions
from obrazovanie.models.category import Category
from obrazovanie.serializers.categorty_serizializers import CategorySerializer
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page

class CategoryList(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    permission_classes = [permissions.AllowAny, ]
    pagination_class = None

    @method_decorator(cache_page(60*60*6))
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)