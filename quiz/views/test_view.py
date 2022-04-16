from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from quiz.models.test import Test
from quiz.models.test_result import TestResult
from quiz.serializers.test_result_serializer import TestResultSerializer
from quiz.serializers.test_serizializer import TestSerializer


class TestDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'test_id'
    queryset = Test.objects.all()
    serializer_class = TestSerializer
    permission_classes = [permissions.IsAuthenticated]


class TestResultDetail(generics.RetrieveAPIView):
    lookup_field = 'test__id'
    lookup_url_kwarg = 'test_id'
    serializer_class = TestResultSerializer
    permission_classes = [permissions.IsAuthenticated]
    attempt_num = 1

    def get_queryset(self):
        return TestResult.objects.filter(user=self.request.user)

    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        lookup_url_kwarg = self.lookup_url_kwarg or self.lookup_field

        filter_kwargs = {
            self.lookup_field: self.kwargs[lookup_url_kwarg],
            'attempt_num': self.attempt_num
        }
        obj = get_object_or_404(queryset, **filter_kwargs)

        self.check_object_permissions(self.request, obj)

        return obj
