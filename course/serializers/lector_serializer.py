from rest_framework import serializers
from course.models.course import Course
from course.models.lector import Lector


class LectorSerializer(serializers.ModelSerializer):
    fullname = serializers.SerializerMethodField(read_only=True)

    def get_fullname(self, obj):
        return obj.get_fullname()

    class Meta:
        model = Lector
        fields = ['id', 'fullname', 'icon']


class LectorDetailSerializer(serializers.ModelSerializer):
    fullname = serializers.SerializerMethodField(read_only=True)

    def get_fullname(self, obj):
        return obj.get_fullname()

    class Meta:
        model = Lector
        exclude = ['name', 'surname', 'created_at', 'updated_at']
