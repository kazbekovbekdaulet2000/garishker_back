from rest_framework import generics
from rest_framework import permissions
from course.serializers.quiz_progress_serializer import QuizProgressSerializer


class LessonQuizStart(generics.CreateAPIView):
    serializer_class = QuizProgressSerializer
    permission_classes = (permissions.IsAuthenticatedOrReadOnly, )