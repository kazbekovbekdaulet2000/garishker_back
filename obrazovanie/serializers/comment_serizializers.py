from urllib.request import Request
from rest_framework import serializers
from obrazovanie.models.comment import Comment
from user.serializers import UserInfoSerializer
from django.contrib.contenttypes.models import ContentType


class RecursiveSerializer(serializers.Serializer):
    def to_representation(self, instance):
        serializer = self.parent.parent.__class__(
            instance, context=self.context)
        return serializer.data


class CommentSerializer(serializers.ModelSerializer):
    replies = RecursiveSerializer(
        source="reply_comment", many=True, read_only=True)

    owner = UserInfoSerializer(required=False)

    likes_count = serializers.IntegerField(
        source="likes.count", read_only=True)
    liked = serializers.SerializerMethodField(read_only=True)

    def get_liked(self, obj):
        user = self.context['request'].user
        return user in obj.likes.all()

    class Meta:
        model = Comment
        fields = "__all__"


class CommentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ['id', 'body', 'reply']

    def create(self, validated_data):
        validated_data['content_type'] = ContentType.objects.get_for_model(
            self.context['model'])
        validated_data['object_id'] = self.context['object_id']
        validated_data['owner'] = self.context['request'].user
        return super().create(validated_data)
