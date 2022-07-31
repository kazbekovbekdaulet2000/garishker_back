from django.http import Http404
from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from course.models.progress.quiz_progress import QuizProgress
from course.serializers.quiz_progress_serializer import QuizProgressSerializer


class LessonQuizStart(generics.CreateAPIView):
    serializer_class = QuizProgressSerializer
    permission_classes = (permissions.IsAuthenticatedOrReadOnly, )


class LessonQuizCurrent(generics.RetrieveAPIView):
    serializer_class = QuizProgressSerializer
    permission_classes = (permissions.IsAuthenticatedOrReadOnly, )

    def get_queryset(self):
        return QuizProgress.objects.filter(
            user__user_id=self.request.user.id,
            user__course_id=self.kwargs['id'],
            lesson_progress__lesson_id=self.kwargs['lesson_id'],
            end_time__isnull=True
        )

    def get_object(self):
        obj = self.get_queryset().last()
        if(not obj):
            raise Http404
        self.check_object_permissions(self.request, obj)
        return obj