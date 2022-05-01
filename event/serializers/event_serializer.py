from rest_framework import serializers
from event.models.event import Event
from event.serializers.city_serializer import CitySerializer


class EventSerializer(serializers.ModelSerializer):
    bookmarks_count = serializers.IntegerField(
        source="saves.count", read_only=True)
    bookmarked = serializers.SerializerMethodField(read_only=True)
    participants_count = serializers.IntegerField(
        source="participants.count", read_only=True)
    city = CitySerializer(many=False)

    def get_bookmarked(self, obj):
        user = self.context['request'].user
        return user in obj.saves.all()

    class Meta:
        model = Event
        fields = ['id', 'name_ru', 'name_kk', 'description_ru', 'description_kk',
                  'city', 'address_ru', 'address_kk', 'address_link', 'event_date', 'bookmarks_count',
                  'bookmarked', 'views', 'max_user_count', 'participants_count', 'poster', 'canceled']


class EventDetailSerializer(EventSerializer):
    class Meta:
        model = EventSerializer.Meta.model
        fields = EventSerializer.Meta.fields
