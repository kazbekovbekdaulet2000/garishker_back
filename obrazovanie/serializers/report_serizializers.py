from rest_framework import serializers
from obrazovanie.models.report import Report
from user.serializers import UserInfoSerializer
from video.serializers import VideoURLSerializer


class BaseReportSerializer(serializers.ModelSerializer):
    liked = serializers.SerializerMethodField(read_only=True)
    bookmarked = serializers.SerializerMethodField(read_only=True)

    def get_liked(self, obj):
        if(self.context['request'].user.is_anonymous):
            return False
        user = self.context['request'].user
        return Report.objects.liked(user, obj.id)

    def get_bookmarked(self, obj):
        if(self.context['request'].user.is_anonymous):
            return False
        user = self.context['request'].user
        return Report.objects.saved(user, obj.id)

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
