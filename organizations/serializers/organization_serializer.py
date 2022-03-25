from rest_framework import serializers
from organizations.models import Organization


class OrganizationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organization
        fields = ['id', 'name_kk', 'name_ru', 'icon']


class OrganizationDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Organization
        fields = ['id', 'name_kk', 'name_ru',
                  'description_kk', 'description_ru', 'icon']
