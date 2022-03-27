from rest_framework import generics
from rest_framework import permissions
from quiz.models.answer import Answer
from quiz.serializers.answer_serizializer import TestQuestionAnswerSerializer


# class TestQuestionAnswerDetail(generics.RetrieveUpdateAPIView):
#     lookup_field = 'id'
#     lookup_url_kwarg = 'answer_id'
#     serializer_class = TestQuestionAnswerSerializer
#     permission_classes = [permissions.IsAuthenticatedOrReadOnly]
#     pagination_class = None

#     def get_queryset(self):
#         return Answer.objects.filter(question__id=self.kwargs['question_id'])
