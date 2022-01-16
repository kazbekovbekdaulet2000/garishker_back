from unicodedata import category
from attr import fields
from rest_framework import serializers
from obrazovanie.models import Report
from user.serializers import UserInfoSerializer


class BaseReportSerializer(serializers.ModelSerializer):
    likes_count = serializers.IntegerField(
        source="likes.count", read_only=True)
    liked = serializers.SerializerMethodField(read_only=True)

    comments_count = serializers.IntegerField(
        source="comments.count", read_only=True)

    bookmarks_count = serializers.IntegerField(
        source="saves.count", read_only=True)
    bookmarked = serializers.SerializerMethodField(read_only=True)

    read_time = serializers.SerializerMethodField(read_only=True)

    category = serializers.StringRelatedField()

    def get_read_time(self, obj):
        return obj.get_reading_time()

    def get_liked(self, obj):
        user = self.context['request'].user
        return user in obj.likes.all()

    def get_bookmarked(self, obj):
        user = self.context['request'].user
        return user in obj.saves.all()

    class Meta:
        model = Report
        fields = ['id', 'category', 'likes_count', 'liked', 'bookmarks_count',
                  'bookmarked', 'title', 'created_at', 'image', 'read_time',
                  'comments_count', 'views']


class ReportDetailSerializer(BaseReportSerializer):
    author = UserInfoSerializer(required=False)

    class Meta(BaseReportSerializer.Meta):
        model = Report
        fields = BaseReportSerializer.Meta.fields + ['author', 'body', ]
