from rest_framework import serializers
from common.contants import VIDEO_URL_TYPE
from video.models.video_url import VideoURL
from video.models.video_quality_item import VideoQualityURL


class VideoQualityURLSerializer(serializers.ModelSerializer):
    class Meta:
        model = VideoQualityURL
        fields = ['url', 'quality']


class VideoURLSerializer(serializers.ModelSerializer):
    qualities = VideoQualityURLSerializer(many=True)
    video = serializers.SerializerMethodField(read_only=True)
    url_type = serializers.SerializerMethodField(read_only=True)

    def get_video(self, obj):
        if(obj.url_type == 1):
            return obj.url.split('?v=')[1].split('&')[0] or obj.video_file.url
        return obj.url or obj.video_file.url
    
    def get_url_type(self, obj):
        return VIDEO_URL_TYPE[obj.url_type][1]

    class Meta:
        model = VideoURL
        fields = ['original_quality', 'video', 'url_type', 'qualities']
