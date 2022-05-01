from rest_framework import serializers
from event.models.event_registration import EventRegistration


class EventRegistrationsSerializer(serializers.ModelSerializer):
    class Meta:
        model = EventRegistration
        fields = "__all__"
