from django.forms import ValidationError
from rest_framework import serializers
from event.models.event_registration import EventRegistration
from django.utils import timezone


class EventRegistrationsSerializer(serializers.ModelSerializer):
    class Meta:
        model = EventRegistration
        fields = "__all__"

    def validate(self, attrs):
        event = attrs['event']
        if(event.participants_count >= event.max_user_count or event.canceled):
            raise ValidationError({'message': 'forbidden'})
        if(event.event_date <= timezone.now()):
            raise ValidationError({'message': 'time error'})
        return attrs
