from rest_framework import generics
from rest_framework import permissions
from rest_framework.response import Response

from course.models.course import Course
from course.models.participant import Participant
from course.serializers.course_serializer import  CourseSerializer

from django_filters.rest_framework import DjangoFilterBackend

from course.serializers.resource_serializer import ResourceSerializer
from course.models.resource import Resource

class ResourceList(generics.ListAPIView):
    lookup_url_kwarg = 'lesson_id'
    serializer_class = ResourceSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly,]
    filter_backends = [DjangoFilterBackend]
    pagination_class = None

    def get_queryset(self):
        return Resource.objects.filter(lesson__id=self.kwargs[self.lookup_url_kwarg])