
from attr import fields
from rest_framework import serializers
from obrazovanie.models import Comment, VideoComment


class RecursiveSerializer(serializers.Serializer):
    def to_representation(self, instance):
        serializer = self.parent.parent.__class__(
            instance, context=self.context)
        return serializer.data


class ReportCommentSerializer(serializers.ModelSerializer):
    replies = RecursiveSerializer(
        source="reply_comment", many=True, read_only=True)

    class Meta:
        model = Comment
        fields = "__all__"


class ReportCommentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ['body', 'reply', 'report']


class VideoCommentSerializer(serializers.ModelSerializer):
    replies = RecursiveSerializer(
        source="reply_comment", many=True, read_only=True)

    class Meta:
        model = VideoComment
        fields = "__all__"


class VideoCommentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = VideoComment
        fields = ['body', 'reply', 'video']
