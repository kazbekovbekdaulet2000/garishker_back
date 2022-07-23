from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from course.models.course.lesson import Lesson
from course.serializers.quiz_serializer import QuizSerializer
from django.http import Http404


class LessonQuiz(generics.RetrieveAPIView):
    serializer_class = QuizSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        return Lesson.objects.filter(course__id=self.kwargs['id'])

    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        filter_kwargs = {'id': self.kwargs['lesson_id']}
        obj = get_object_or_404(queryset, **filter_kwargs)
        if(obj.quiz == None):
            raise Http404
        self.check_object_permissions(self.request, obj.quiz)
        return obj.quiz