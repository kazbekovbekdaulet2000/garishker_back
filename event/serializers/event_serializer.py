from rest_framework import serializers
from event.models.event import Event
from event.serializers.city_serializer import CitySerializer
from video.models.video_url import VideoURL
from video.serializers import VideoURLSerializer


class EventSerializer(serializers.ModelSerializer):
    liked = serializers.SerializerMethodField(read_only=True)
    bookmarked = serializers.SerializerMethodField(read_only=True)
    video = serializers.SerializerMethodField(read_only=True)

    def get_video(self, obj):
        data = VideoURL.objects.get_object_by_model(model=Event, id=obj.id)
        if data: 
            return VideoURLSerializer(data[0], many=False).data
        return None

    def get_liked(self, obj):
        if(self.context['request'].user.is_anonymous):
            return False
        user = self.context['request'].user
        return Event.objects.liked(user, obj.id)

    def get_bookmarked(self, obj):
        if(self.context['request'].user.is_anonymous):
            return False
        user = self.context['request'].user
        return Event.objects.saved(user, obj.id)

    participants_count = serializers.IntegerField(
        source="participants.count", read_only=True)
    city = CitySerializer(many=False)

    class Meta:
        model = Event
        fields = ['id', 'name_ru', 'name_kk', 'description_ru', 'description_kk',
                  'city', 'address_ru', 'address_kk', 'address_link', 'event_date', 'views',
                  'max_user_count', 'participants_count', 'poster', 'canceled', 'liked', 'bookmarked', 
                  'likes_count', 'comments_count', 'bookmarks_count', 'video']


class EventDetailSerializer(EventSerializer):
    class Meta:
        model = EventSerializer.Meta.model
        fields = EventSerializer.Meta.fields
