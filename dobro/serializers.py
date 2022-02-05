from rest_framework import serializers
from .models import *


class DobroSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dobro
        fields = ['id', 'title', 'small_description',
                  'is_completed', 'collected', 'necessary', 'image']


class DobroDetailSerializer(DobroSerializer):
    class Meta(DobroSerializer.Meta):
        fields = DobroSerializer.Meta.fields + \
            ['description', 'video', 'reports', 'body']
