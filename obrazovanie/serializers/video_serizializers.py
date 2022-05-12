from rest_framework import serializers
from obrazovanie.models.video import Video, VideoQuality
from user.serializers import UserInfoSerializer
from django.conf import settings
from django.contrib.contenttypes.models import ContentType


class BaseVideoSerializer(serializers.ModelSerializer):
    liked = serializers.SerializerMethodField(read_only=True)
    bookmarked = serializers.SerializerMethodField(read_only=True)

    def get_liked(self, obj):
        if(self.context['request'].user.is_anonymous):
            return False
        user = self.context['request'].user
        return Video.objects.liked(user, obj.id)

    def get_bookmarked(self, obj):
        if(self.context['request'].user.is_anonymous):
            return False
        user = self.context['request'].user
        return Video.objects.saved(user, obj.id)

    class Meta:
        model = Video
        fields = ['id', 'category', 'likes_count', 'liked', 'bookmarks_count',
                  'bookmarked', 'title_ru', 'title_kk', 'created_at', 'image', 'image_2', 'views',
                  'comments_count', 'youtube', 'duriation', 'languages']


class VideoQualitiesSerializer(serializers.ModelSerializer):
    class Meta:
        model = VideoQuality
        exclude = ['id', 'created_at', 'updated_at', 'width', 'height']


class VideoDetailSerializer(BaseVideoSerializer):
    author = UserInfoSerializer(required=False)
    video_quality = VideoQualitiesSerializer(many=True, read_only=True)

    video = serializers.SerializerMethodField(read_only=True)

    def get_video(self, obj):
        if(not obj.video_name):
            return None
        return f"{settings.AWS_S3_ENDPOINT_URL}/garysh-app/video-video/{obj.video_name}"

    class Meta(BaseVideoSerializer.Meta):
        model = Video
        fields = BaseVideoSerializer.Meta.fields + \
            ['author', 'body_ru', 'body_kk', 'video',
                'video_quality', 'original_quality', 'subs_kk']
