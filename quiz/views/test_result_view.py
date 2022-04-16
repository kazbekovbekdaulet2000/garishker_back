from rest_framework import generics
from rest_framework import permissions
from quiz.models.test_result import TestResult
from quiz.serializers.test_result_serializer import TestResultCreateSerializer


class TestResultCreate(generics.CreateAPIView):
    serializer_class = TestResultCreateSerializer
    permission_classes = [permissions.IsAuthenticated]
    attempt_num = 1

    def get_queryset(self):
        return TestResult.objects.filter(user=self.request.user)
