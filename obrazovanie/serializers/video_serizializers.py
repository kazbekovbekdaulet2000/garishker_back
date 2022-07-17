from rest_framework import serializers
from obrazovanie.models.video import Video
from user.serializers import UserInfoSerializer
from django.conf import settings
from video.models.video_url import VideoURL
from video.serializers import VideoURLSerializer


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
                  'comments_count', 'duriation', 'languages', 'tags']


class VideoDetailSerializer(BaseVideoSerializer):
    author = UserInfoSerializer(required=False)
    video = VideoURLSerializer(many=False)

    class Meta(BaseVideoSerializer.Meta):
        model = Video
        fields = BaseVideoSerializer.Meta.fields + \
            ['author', 'body_ru', 'body_kk', 'video', 'original_quality', 'subs_kk']
