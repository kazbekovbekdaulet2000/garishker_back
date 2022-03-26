from rest_framework import generics
from rest_framework import permissions
from quiz.models.test import Test
from quiz.serializers.question_serizializer import TestSerializer
from django.http import Http404

class TestDetail(generics.ListAPIView):
    serializer_class = TestSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class=None

    def get_queryset(self):
        return Test.objects.filter(lesson__id=self.kwargs['lesson_id'])

    def get_object(self):
        obj = self.get_queryset().last()
        if(obj):
            self.check_object_permissions(self.request, obj)
            return obj
        else:
            raise Http404