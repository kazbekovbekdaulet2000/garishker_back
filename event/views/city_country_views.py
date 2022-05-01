from rest_framework import generics
from rest_framework import permissions
from event.models.city import City
from event.models.country import Country
from event.serializers.city_serializer import CitySerializer
from event.serializers.country_serializer import CountrySerializer
from django.utils.translation import gettext_lazy as _
from django_filters.rest_framework import DjangoFilterBackend


class CountryList(generics.ListAPIView):
    queryset = Country.objects.all()
    serializer_class = CountrySerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    pagination_class = None


class CityList(generics.ListAPIView):
    queryset = City.objects.all()
    serializer_class = CitySerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    filter_backends = (DjangoFilterBackend, )
    filterset_fields = ('country', )
    pagination_class = None
