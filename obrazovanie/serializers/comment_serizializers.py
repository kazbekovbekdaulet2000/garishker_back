
from attr import fields
from rest_framework import serializers
from obrazovanie.models import Comment, VideoComment
from user.serializers import UserInfoSerializer


class RecursiveSerializer(serializers.Serializer):
    def to_representation(self, instance):
        serializer = self.parent.parent.__class__(
            instance, context=self.context)
        return serializer.data


class ReportCommentSerializer(serializers.ModelSerializer):
    replies = RecursiveSerializer(
        source="reply_comment", many=True, read_only=True)

    owner = UserInfoSerializer(required=False)

    class Meta:
        model = Comment
        fields = "__all__"


class ReportCommentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ['body', 'reply', 'report']

    def create(self, validated_data):
        validated_data['owner'] = self.context['request'].user
        return super().create(validated_data)

class VideoCommentSerializer(serializers.ModelSerializer):
    replies = RecursiveSerializer(
        source="reply_comment", many=True, read_only=True)

    owner = UserInfoSerializer(required=False)

    class Meta:
        model = VideoComment
        fields = "__all__"


class VideoCommentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = VideoComment
        fields = ['body', 'reply', 'video']

    def create(self, validated_data):
        validated_data['owner'] = self.context['request'].user
        return super().create(validated_data)
