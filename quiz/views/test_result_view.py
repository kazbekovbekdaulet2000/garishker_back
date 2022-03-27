from rest_framework import generics
from rest_framework import permissions
from quiz.models.test_result import TestResult
from quiz.serializers.test_result_serializer import TestResultCreateSerializer


class TestResultCreate(generics.CreateAPIView):
    queryset = TestResult.objects.all()
    serializer_class = TestResultCreateSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return TestResult.objects.filter(user=self.request.user)

    def get_serializer_context(self):
        return {
            'request': self.request,
            'format': self.format_kwarg,
            'view': self,
            'test_id': self.kwargs.get('test_id')
        }
