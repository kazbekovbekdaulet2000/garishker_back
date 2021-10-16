import django_filters
from django_filters import rest_framework as filters
from .models import *


class SearchFilter(filters.FilterSet):
    title = django_filters.CharFilter(lookup_expr='icontains')

    class Meta:
        model = Report
        fields = ['title']