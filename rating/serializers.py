from rest_framework import serializers
from rating.models import Rating
from user.serializers import UserInfoSerializer
from django.contrib.contenttypes.models import ContentType


class RatingSerializer(serializers.ModelSerializer):
    owner = UserInfoSerializer(required=False)

    likes_count = serializers.IntegerField(
        source="likes.count", read_only=True)
    liked = serializers.SerializerMethodField(read_only=True)

    def get_liked(self, obj):
        user = self.context['request'].user
        return user in obj.likes.all()

    class Meta:
        model = Rating
        exclude = ['likes', 'created_at',
                   'updated_at', 'content_type', 'object_id']


class RatingCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rating
        fields = ['id', 'body', 'rating']

    def create(self, validated_data):
        model = self.context['view'].model
        object_id = self.context['view'].kwargs.get('id')
        user = self.context['request'].user
        validated_data['content_type'] = ContentType.objects.get_for_model(model)
        validated_data['object_id'] = object_id
        validated_data['owner'] = user
        return super().create(validated_data)
