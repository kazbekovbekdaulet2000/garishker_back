from rest_framework import generics
from rest_framework import permissions
from quiz.models.test import Test
from quiz.models.test_result import TestResult
from quiz.serializers.test_result_serializer import TestResultSerializer
from quiz.serializers.test_serizializer import TestSerializer

# TODO permissions
class TestDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'test_id'
    queryset = Test.objects.all()
    serializer_class = TestSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


# TODO permissions
class TestResultDetail(generics.RetrieveAPIView):
    lookup_field = 'test__id'
    lookup_url_kwarg = 'test_id'
    serializer_class = TestResultSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_queryset(self):
        print(TestResult.objects.filter(user=self.request.user))
        return TestResult.objects.filter(user=self.request.user)


# class TestNewAttempDetail(generics.CreateAPIView):
#     lookup_field = 'id'
#     lookup_url_kwarg = 'test_id'
#     queryset = TestResult.objects.all()
#     serializer_class = TestNewAttemptSerializer
#     permission_classes = [permissions.IsAuthenticatedOrReadOnly]

#     def get_queryset(self):
#         return TestResult.objects.filter(user=self.request.user)
