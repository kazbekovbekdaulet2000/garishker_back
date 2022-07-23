from rest_framework import generics
from rest_framework import permissions
from rest_framework.response import Response
from course.models.course.lesson import Lesson
from django_filters.rest_framework import DjangoFilterBackend
from course.permissions import LessonAvailable
from course.serializers.lesson_serializer import LessonDetailSerializer, LessonSerializer


class LessonList(generics.ListAPIView):
    serializer_class = LessonSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    filter_backends = [DjangoFilterBackend]
    pagination_class = None

    def get_queryset(self):
        return Lesson.objects.filter(course__id=self.kwargs['id']).order_by('order')


class LessonDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'lesson_id'
    serializer_class = LessonDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, LessonAvailable]

    def get_queryset(self):
        return Lesson.objects.filter(course__id=self.kwargs['id']).order_by('order')

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.increase_views()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)