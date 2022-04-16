from rest_framework import generics
from rest_framework import permissions

from course.models.course import Course
from course.models.participant import Participant

from django_filters.rest_framework import DjangoFilterBackend
from django.contrib.contenttypes.models import ContentType
from course.serializers.course_serializer import CourseSerializer

from course.serializers.participant_serializer import ParticipationCreateSerializer, ParticipationSerializer


class CourseParticipation(generics.CreateAPIView):
    lookup_url_kwarg = None
    permission_classes = [permissions.IsAuthenticated, ]
    # filter_backends = [DjangoFilterBackend]
    filter_backends = None
    model = None

    def get_serializer_class(self):
        if self.request.method == "POST":
            return ParticipationCreateSerializer
        return ParticipationSerializer

    def get_queryset(self):
        return Participant.objects.filter(
            content_type=ContentType.objects.get_for_model(self.model),
            object_id=self.kwargs[self.lookup_url_kwarg])


class UserParticipationList(generics.ListAPIView):
    serializer_class = CourseSerializer
    permission_classes = [permissions.IsAuthenticated, ]
    # filter_backends = [DjangoFilterBackend]
    filter_backends = None
    model = None

    def get_queryset(self):
        participant = Participant.objects.filter(user=self.request.user,
                                                 content_type=ContentType.objects.get_for_model(self.model))
        course_ids = []
        for i in participant:
            course_ids.append(i.object_id)
        return self.model.objects.filter(id__in=course_ids)
