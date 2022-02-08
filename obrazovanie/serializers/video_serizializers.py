from rest_framework import serializers
from obrazovanie.models.video import Video, VideoQuality
from user.serializers import UserInfoSerializer


class BaseVideoSerializer(serializers.ModelSerializer):
    likes_count = serializers.IntegerField(
        source="likes.count", read_only=True)
    liked = serializers.SerializerMethodField(read_only=True)

    comments_count = serializers.IntegerField(
        source="video_comments.count", read_only=True)

    bookmarks_count = serializers.IntegerField(
        source="saves.count", read_only=True)
    bookmarked = serializers.SerializerMethodField(read_only=True)

    category = serializers.StringRelatedField()

    def get_liked(self, obj):
        user = self.context['request'].user
        return user in obj.likes.all()

    def get_bookmarked(self, obj):
        user = self.context['request'].user
        return user in obj.saves.all()

    class Meta:
        model = Video
        fields = ['id', 'category', 'likes_count', 'liked', 'bookmarks_count',
                  'bookmarked', 'title', 'created_at', 'image', 'views', 'comments_count']


class VideoQualitiesSerializer(serializers.ModelSerializer):
    class Meta:
        model = VideoQuality
        exclude = ['id', 'created_at', 'updated_at', 'width', 'height']


class VideoDetailSerializer(BaseVideoSerializer):
    author = UserInfoSerializer(required=False)
    video_quality = VideoQualitiesSerializer(many=True, read_only=True)

    class Meta(BaseVideoSerializer.Meta):
        model = Video
        fields = BaseVideoSerializer.Meta.fields + \
            ['author', 'body', 'video', 'video_quality']
