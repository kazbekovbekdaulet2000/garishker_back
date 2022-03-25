from rest_framework import generics
from rest_framework import permissions
from rest_framework.response import Response

from course.models.course import Course
from course.models.participant import Participant
from course.serializers.course_serializer import CourseDetailSerializer, CourseSerializer

from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Q
from django.shortcuts import get_object_or_404
from django.contrib.contenttypes.models import ContentType


class CourseList(generics.ListAPIView):
    queryset = Course.objects.filter(to_view=True)
    serializer_class = CourseSerializer
    permission_classes = [permissions.AllowAny, ]
    filter_backends = [DjangoFilterBackend]


class CourseDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    queryset = Course.objects.filter(to_view=True)
    serializer_class = CourseDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.increase_views()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)
