from django.forms import ValidationError
from rest_framework import serializers
from course.models.participant import Participant
from user.serializers import UserInfoSerializer
from django.contrib.contenttypes.models import ContentType


class ParticipationSerializer(serializers.ModelSerializer):
    user = UserInfoSerializer(required=False)

    class Meta:
        model = Participant
        fields = ['id', 'user', 'created_at', 'updated_at']


class ParticipationCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Participant
        fields = ['id', 'created_at', 'updated_at']

    def validate(self, attrs):
        object_id = self.context['view'].kwargs[self.context['view'].lookup_url_kwarg]
        model = self.context['view'].model

        if Participant.objects.filter(object_id=object_id,
                                      content_type=ContentType.objects.get_for_model(model),
                                      user=self.context['request'].user).count() > 0:
            raise ValidationError("Запись уже есть")
        return attrs

    def create(self, validated_data):
        object_id = self.context['view'].kwargs[self.context['view'].lookup_url_kwarg]
        model = self.context['view'].model
        validated_data['content_type'] = ContentType.objects.get_for_model(model)
        validated_data['object_id'] = object_id
        validated_data['user'] = self.context['request'].user
        return super().create(validated_data)
