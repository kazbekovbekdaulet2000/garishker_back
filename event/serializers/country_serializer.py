from this import d
from rest_framework import serializers
from event.models.country import Country


class CountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Country
        fields = ['id', 'name_ru', 'name_kk']
