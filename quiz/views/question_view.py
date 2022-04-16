from rest_framework import generics
from rest_framework import permissions
from quiz.models.attempt import Attempt
from quiz.models.question import Question
from quiz.models.test_result import TestResult
from quiz.serializers.attemp_serializer import TestAttemptCreateSerializer
from quiz.serializers.question_serizializer import TestQuestionSerializer
from rest_framework import mixins
from django.contrib.contenttypes.models import ContentType


class TestQuestionList(generics.ListAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'test_id'
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = TestQuestionSerializer
    pagination_class = None
    attempt_num = 1

    def get_queryset(self):
        # test_res = TestResult.objects.filter(
        #     user=self.request.user,
        #     success=False,
        #     test__id=self.kwargs['test_id']
        # )
        # self.attempt_num = test_res.count()+1
        return Question.objects.filter(is_active=True, quiz__id=self.kwargs['test_id'])


class TestQuestion(mixins.CreateModelMixin, generics.GenericAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'question_id'
    queryset = Question.objects.filter(is_active=True)
    permission_classes = [permissions.IsAuthenticated]
    attempt_num = 1

    def get_serializer_class(self):
        return TestAttemptCreateSerializer

    def get_queryset(self):
        return Attempt.objects.filter(
            content_type=ContentType.objects.get_for_model(Question),
            user=self.request.user
        )

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
