from rest_framework import generics
from rest_framework import permissions
from django_filters.rest_framework import FilterSet, CharFilter
from event.models.event import Event
from event.models.event_registration import EventRegistration
from event.serializers.event_registration_serializer import EventRegistrationsSerializer
from event.serializers.event_serializer import EventDetailSerializer, EventSerializer
from django.utils.translation import gettext_lazy as _
from datetime import datetime, timedelta


def filter_by_time(queryset, name, value):
    current_date = datetime.today()
    past_date = current_date - timedelta(days=365*4)
    future_date = current_date + timedelta(days=365)
    if(value == 'past'):
        return queryset.filter(event_date__range=[past_date, current_date])
    return queryset.filter(event_date__range=[current_date, future_date])


class EventFilter(FilterSet):
    time = CharFilter(method=filter_by_time)

    class Meta:
        model = Event
        fields = ['time']


class EventsList(generics.ListAPIView):
    queryset = Event.objects.all()
    serializer_class = EventSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    filterset_class = EventFilter


class EventsDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    queryset = Event.objects.all()
    serializer_class = EventDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]


class EventsDetailSlug(generics.RetrieveAPIView):
    lookup_field = 'slug'
    queryset = Event.objects.all()
    serializer_class = EventDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]


class EventParticipate(generics.CreateAPIView):
    permission_classes = [permissions.AllowAny]
    queryset = EventRegistration.objects.all()
    serializer_class = EventRegistrationsSerializer
