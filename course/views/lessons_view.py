from django.http import Http404
from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from rest_framework.response import Response
from course.models.course import Course
from course.models.lesson import Lesson
from django_filters.rest_framework import DjangoFilterBackend
from course.models.participant import Participant
from course.permissions import LessonAvailable
from course.serializers.lesson_serializer import LessonDetailSerializer, LessonSerializer
from django.contrib.contenttypes.models import ContentType
from rest_framework.views import APIView
from rest_framework import status


class LessonList(generics.ListAPIView):
    serializer_class = LessonSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    filter_backends = [DjangoFilterBackend]

    def get_queryset(self):
        return Lesson.objects.filter(course__id=self.kwargs['id']).order_by('order')


class LessonDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'lesson_id'
    serializer_class = LessonDetailSerializer
    permission_classes = [
        permissions.IsAuthenticatedOrReadOnly, LessonAvailable]

    def get_queryset(self):
        return Lesson.objects.filter(course__id=self.kwargs['id']).order_by('order')

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.increase_views()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class LessonCurrent(generics.RetrieveAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'lesson_id'
    serializer_class = LessonDetailSerializer
    permission_classes = [
        permissions.IsAuthenticatedOrReadOnly, LessonAvailable]

    def get_queryset(self):
        return Lesson.objects.filter(course__id=self.kwargs['id']).order_by('order')

    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        ids = queryset.values_list('id', flat=True)
        if(len(ids) == 0):
            raise Http404

        filter_kwargs = {self.lookup_field: ids[0]}

        if self.request.user.is_anonymous:
            obj = get_object_or_404(queryset, **filter_kwargs)
        else:
            participations = Participant.objects.filter(
                user=self.request.user,
                content_type=ContentType.objects.get_for_model(Lesson),
                object_id__in=ids).order_by('id')

            index = 0
            for participation in participations:
                if(participation.success == False):
                    break
                else:
                    index += 1
            try:
                filter_kwargs = {self.lookup_field: ids[index]}
            except IndexError:
                courser_participation = get_object_or_404(Participant, **{
                    'user': self.request.user,
                    'content_type': ContentType.objects.get_for_model(Course),
                    'object_id': self.kwargs['id']})
                courser_participation.success = True
                courser_participation.save()
                filter_kwargs = {self.lookup_field: ids[0]}

            obj = get_object_or_404(queryset, **filter_kwargs)

        self.check_object_permissions(self.request, obj)
        return obj

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.increase_views()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class LessonNext(APIView):
    permission_classes = [permissions.IsAuthenticated, LessonAvailable]

    def post(self, request, *args, **kwargs):
        lessons = Lesson.objects.filter(
            course__id=self.kwargs['id']).order_by('order')
        ids = lessons.values_list('id', flat=True)
        queryset = Participant.objects.filter(
            user=self.request.user,
            content_type=ContentType.objects.get_for_model(Lesson),
            object_id__in=ids).order_by('id')
        for participation in queryset:
            if(participation.success == False):
                participation.success = True
                participation.save()
                return Response({"message": "0"}, status=status.HTTP_400_BAD_REQUEST)
        return Response({"message": "1"}, status=status.HTTP_400_BAD_REQUEST)
