from rest_framework import generics
from rest_framework import permissions
from quiz.models.question import Question
from quiz.serializers.question_serizializer import TestQuestionSerializer


class TestQuestion(generics.RetrieveAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'question_id'
    serializer_class = TestQuestionSerializer
    queryset = Question.objects.filter(is_active=True)
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]