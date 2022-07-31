from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from rest_framework.response import Response
from course.models.course.course import Course
from course.models.course.lesson import Lesson
from django_filters.rest_framework import DjangoFilterBackend
from course.models.progress.course_user import CourseUser
from course.permissions import LessonAvailable
from course.serializers.lesson_serializer import LessonDetailSerializer, LessonSerializer


class LessonList(generics.ListAPIView):
    serializer_class = LessonSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    filter_backends = [DjangoFilterBackend]
    pagination_class = None
    user_course = None

    def get_queryset(self):
        user = self.request.user
        if(not user.is_anonymous):
            course = get_object_or_404(Course, id=self.kwargs['id'])
            self.user_course = CourseUser.objects.filter(user=user, course=course).first()
        return Lesson.objects.filter(course__id=self.kwargs['id']).order_by('order')


class LessonDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'lesson_id'
    serializer_class = LessonDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, LessonAvailable]
    user_course = None

    def get_queryset(self):
        self.get_user_couser()
        return Lesson.objects.filter(course__id=self.kwargs['id']).order_by('order')

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.increase_views()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)    

    def get_user_couser(self):
        user = self.request.user
        course = get_object_or_404(Course, id=self.kwargs['id'])
        self.user_course = CourseUser.objects.filter(user=user, course=course).first()