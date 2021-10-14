from rest_framework import serializers
from .models import *


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['name']


class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Section
        fields = '__all__'


class ReportCreateSerializer(serializers.ModelSerializer):
    author = serializers.ReadOnlyField(source='author.email')
    
    class Meta:
        model = Report
        fields = ['id', 'title', 'image', 'created_at', 'category', 'author']


class ReportDetailSerializer(ReportCreateSerializer):
    class Meta(ReportCreateSerializer.Meta):
        fields = ReportCreateSerializer.Meta.fields + ['body']


class ReportListSerializer(ReportCreateSerializer):
    category = CategorySerializer()

    class Meta(ReportCreateSerializer.Meta):
        fields = ReportCreateSerializer.Meta.fields + ['category']


class VideoSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)
    section = SectionSerializer(read_only=True)

    class Meta:
        model = Video
        fields = ['title', 'body', 'section', 'video', 'created_at', 'category']


class CategoryRelatedDataSerializer(serializers.ModelSerializer):
    report_category = ReportListSerializer(many=True)
    video_category = VideoSerializer(many=True)

    class Meta:
        model = Category
        fields = ['report_category', 'video_category']