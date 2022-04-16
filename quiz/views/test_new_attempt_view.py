from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from quiz.models.attempt import Attempt
from quiz.models.question import Question
from quiz.models.test import Test
from quiz.models.test_result import TestResult
from quiz.serializers.test_serizializer import TestSerializer
from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from django.contrib.contenttypes.models import ContentType


class TestNewAttemp(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, *args, **kwargs):
        user = request.user
        test_id = kwargs['test_id']
        test_res = get_object_or_404(
            TestResult, **{
                'user': user,
                'test__id': test_id
            }
        )
        if(test_res.success == False):
            ids = Question.objects.filter(quiz__id=test_id).values_list('id', flat=True)
            attempts = Attempt.objects.filter(
                content_type=ContentType.objects.get_for_model(Question),
                object_id__in=list(ids),
                user=user
            )
            for attempt in attempts:
                attempt.delete()
            test_res.delete()

            return Response({"message": "deleted"}, status=status.HTTP_202_ACCEPTED)
        return Response({"message": "err"}, status=status.HTTP_400_BAD_REQUEST)
