from rest_framework import serializers
from obrazovanie.models.report import Report
from reaction.models.like import Like
from user.serializers import UserInfoSerializer
from video.serializers import VideoURLSerializer
from reaction.models.bookmark import Bookmark
from reaction.models.like import Like
from django.contrib.contenttypes.models import ContentType


class BaseReportSerializer(serializers.ModelSerializer):
    liked = serializers.SerializerMethodField(read_only=True)
    bookmarked = serializers.SerializerMethodField(read_only=True)

    def get_liked(self, obj):
        if(self.context['request'].user.is_anonymous):
            return False
        user = self.context['request'].user
        
        return Like.objects.filter(
            object_id=obj.id,
            content_type=ContentType.objects.get_for_model(Report),
            owner_id=user.id
        ).exists()

    def get_bookmarked(self, obj):
        if(self.context['request'].user.is_anonymous):
            return False
        user = self.context['request'].user
        return Bookmark.objects.filter(
            object_id=obj.id,
            content_type=ContentType.objects.get_for_model(Report),
            owner_id=user.id
        ).exists()

    class Meta:
        model = Report
        fields = ['id', 'category', 'likes_count', 'liked', 'bookmarks_count',
                  'bookmarked', 'title_ru', 'title_kk', 'created_at', 'image', 'read_time',
                  'comments_count', 'views', 'preview_text_ru', 'preview_text_kk', 'languages', 'tags']


class ReportDetailSerializer(BaseReportSerializer):
    author = UserInfoSerializer(required=False)
    video = VideoURLSerializer(many=False)

    class Meta(BaseReportSerializer.Meta):
        model = Report
        fields = BaseReportSerializer.Meta.fields + \
            ['author', 'body_ru', 'body_kk', 'video']
