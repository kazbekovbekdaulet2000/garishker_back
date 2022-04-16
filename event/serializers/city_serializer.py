from this import d
from rest_framework import serializers
from event.models.event import City


class CitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = ['id', 'name_ru', 'name_kk']
