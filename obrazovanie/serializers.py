from rest_framework import serializers
from .models import *


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'


class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Section
        fields = '__all__'


class ReportSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)
    
    class Meta:
        model = Report
        fields = ['title', 'body', 'image', 'created_at', 'category']


class VideoSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)
    section = SectionSerializer(read_only=True)

    class Meta:
        model = Video
        fields = ['title', 'body', 'section', 'video', 'created_at', 'category']


class CategoryRelatedDataSerializer(serializers.ModelSerializer):
    report_category = ReportSerializer(many=True)
    video_category = VideoSerializer(many=True)

    class Meta:
        model = Category
        fields = ['report_category', 'video_category']