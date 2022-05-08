from rest_framework import serializers
from reaction.models.comment import Comment
from reaction.serializers.generic_serializer import ReactionGenericSerializer
from django.contrib.contenttypes.models import ContentType
from user.serializers import UserInfoSerializer


class RecursiveSerializer(serializers.Serializer):
    def to_representation(self, instance):
        serializer = self.parent.parent.__class__(
            instance, context=self.context)
        return serializer.data


class CommentSerializer(ReactionGenericSerializer):
    replies = RecursiveSerializer(source="comments_reply", many=True, read_only=True)

    owner = UserInfoSerializer(required=False)

    class Meta:
        model = Comment
        fields = ReactionGenericSerializer.Meta.fields + \
            ('body', 'reply', 'replies')


class CommentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ('id', 'body', 'reply')

    def create(self, validated_data):
        lookup_field = self.context['view'].lookup_field
        validated_data['content_type'] = ContentType.objects.get_for_model(self.context['view'].model)
        validated_data['object_id'] = self.context['view'].kwargs[lookup_field]
        validated_data['owner'] = self.context['request'].user
        return super().create(validated_data)
