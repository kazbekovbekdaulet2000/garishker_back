from rest_framework import serializers
from django.contrib.contenttypes.models import ContentType
from reaction.models.bookmark import Bookmark


class BookmarkSerializer(serializers.ModelSerializer):
    bookmarked = serializers.SerializerMethodField(read_only=True)

    def get_bookmarked(self, obj):
        return not (obj == {})

    class Meta:
        model = Bookmark
        fields = ('id', 'object_id', 'bookmarked')

    def create(self, validated_data):
        lookup_field = self.context['view'].lookup_field

        obj = Bookmark.objects.get_object_by_user(
            self.context['view'].model,
            self.context['view'].kwargs[lookup_field],
            self.context['request'].user
        )
        if(obj.count() >= 1):
            obj.delete()
            return validated_data
        else:
            validated_data['content_type'] = ContentType.objects.get_for_model(
                self.context['view'].model)
            validated_data['object_id'] = self.context['view'].kwargs[lookup_field]
            validated_data['owner'] = self.context['request'].user
            return super().create(validated_data)