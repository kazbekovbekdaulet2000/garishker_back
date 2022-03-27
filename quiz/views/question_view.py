from rest_framework import generics
from rest_framework import permissions
from quiz.models.attempt import Attempt
from quiz.models.question import Question
from quiz.serializers.attemp_serializer import TestAttemptCreateSerializer
from quiz.serializers.question_serizializer import TestQuestionSerializer
from rest_framework import mixins
from django.contrib.contenttypes.models import ContentType


class TestQuestion(mixins.CreateModelMixin, mixins.RetrieveModelMixin, generics.GenericAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'question_id'
    queryset = Question.objects.filter(is_active=True)
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_serializer_class(self):
        if self.request.method == "POST":
            return TestAttemptCreateSerializer
        return TestQuestionSerializer

    def get_queryset(self):
        if self.request.method == "POST":
            return Attempt.objects.filter(
                content_type=ContentType.objects.get_for_model(Question),
                user=self.request.user
            )
        return Question.objects.filter(is_active=True, quiz__id=self.kwargs['test_id'])

    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

    def get_serializer_context(self):
        if self.request.method == "POST":
            print(self.request)
            return {
                'request': self.request,
                'format': self.format_kwarg,
                'view': self,
                'object_id': self.kwargs.get('question_id')
            }
        return super().get_serializer_context()
