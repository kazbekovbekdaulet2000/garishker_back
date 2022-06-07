from rest_framework import serializers
from video.models.video_url import VideoURL
from video.models.video_quality_item import VideoQualityURL


class VideoQualityURLSerializer(serializers.ModelSerializer):
    class Meta:
        model = VideoQualityURL
        fields = ['url', 'quality']


class VideoURLSerializer(serializers.ModelSerializer):
    qualities = VideoQualityURLSerializer(many=True)
    video = serializers.SerializerMethodField(read_only=True)

    def get_video(self, obj):
        return obj.url or obj.video_file.url

    class Meta:
        model = VideoURL
        fields = ['original_quality', 'video', 'qualities']
