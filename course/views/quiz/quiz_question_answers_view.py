from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from course.models.progress.question_progress import QuizQuestionProgress
from course.models.quiz.answer import Answer
from course.models.quiz.question import Question
from course.serializers.quiz_question_progress_serializer import QuizQuestionProgressSerializer


class LessonQuizQuestionAnswers(generics.ListCreateAPIView):
    serializer_class = QuizQuestionProgressSerializer
    pagination_class = None
    permission_classes = (permissions.IsAuthenticated, )

    def get_queryset(self):
        question = get_object_or_404(Question, id=self.kwargs['question_id'])
        return QuizQuestionProgress.objects.filter(question=question).order_by('created_at')
