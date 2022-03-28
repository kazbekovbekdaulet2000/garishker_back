from rest_framework import serializers
from obrazovanie.models.comment import Comment
from obrazovanie.models.video import Video, VideoQuality
from user.serializers import UserInfoSerializer
from django.conf import settings
from django.contrib.contenttypes.models import ContentType


class BaseVideoSerializer(serializers.ModelSerializer):
    likes_count = serializers.IntegerField(
        source="likes.count", read_only=True)
    liked = serializers.SerializerMethodField(read_only=True)

    comments_count = serializers.SerializerMethodField(read_only=True)

    bookmarks_count = serializers.IntegerField(
        source="saves.count", read_only=True)
    bookmarked = serializers.SerializerMethodField(read_only=True)

    category = serializers.StringRelatedField()

    def get_comments_count(self, obj) -> int:
        return len(Comment.objects.filter(
            content_type=ContentType.objects.get_for_model(Video),
            object_id=obj.id))

    def get_liked(self, obj):
        user = self.context['request'].user
        return user in obj.likes.all()

    def get_bookmarked(self, obj):
        user = self.context['request'].user
        return user in obj.saves.all()

    class Meta:
        model = Video
        fields = ['id', 'category', 'likes_count', 'liked', 'bookmarks_count',
                  'bookmarked', 'title', 'created_at', 'image', 'image_2', 'views',
                  'comments_count', 'body', 'youtube', 'duriation']


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
            ['author', 'video', 'video_quality', 'original_quality', 'subs_kk']
