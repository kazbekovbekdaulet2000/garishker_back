from django_filters import rest_framework as filters
from shop.models.product.product import Product


def filter_by_ids(queryset, name, value):
    values = value.split(',')
    return queryset.filter(id__in=values)


class ProductFilter(filters.FilterSet):
    ids = filters.CharFilter(method=filter_by_ids)

    class Meta:
        model = Product
        fields = ['ids',]
