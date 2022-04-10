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
        if Participant.objects.filter(object_id=self.context['object_id'],
                                      content_type=ContentType.objects.get_for_model(self.context['model']),
                                      user=self.context['request'].user).count() > 0:
            raise ValidationError("Запись уже есть")
        return attrs

    def create(self, validated_data):
        validated_data['content_type'] = ContentType.objects.get_for_model(self.context['model'])
        validated_data['object_id'] = self.context['object_id']
        validated_data['user'] = self.context['request'].user
        return super().create(validated_data)
