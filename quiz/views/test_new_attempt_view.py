from rest_framework import generics
from rest_framework import permissions
from quiz.models.test import Test
from quiz.models.test_result import TestResult
from quiz.serializers.test_serizializer import TestSerializer


class TestNewAttemp(generics.CreateAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'test_id'
    queryset = TestResult.objects.all()
    # serializer_class = TestNewAttemptSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        return TestResult.objects.filter(user=self.request.user)
