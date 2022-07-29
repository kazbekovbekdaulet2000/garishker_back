from django.http import Http404
from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from course.models.course.lesson import Lesson
from course.models.progress.course_user import CourseUser
from course.models.progress.quiz_progress import QuizProgress
from course.models.quiz.question import Question
from course.serializers.quiz_question_progress_serializer import QuizQuestionProgressSerializer
from course.serializers.quiz_question_serializer import QuizQuestionDetailSerializer, QuizQuestionSerializer


class LessonQuizQuestionList(generics.ListAPIView):
    serializer_class = QuizQuestionSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = None
    user_course = None
    quiz_progress = None

    def get_queryset(self):
        queryset = Lesson.objects.filter(course__id=self.kwargs['id'])
        filter_kwargs = {'id': self.kwargs['lesson_id']}
        lesson = get_object_or_404(queryset, **filter_kwargs)
        self.user_course = get_object_or_404(CourseUser, **{
            'user': self.request.user,
            'course': lesson.course
        })

        self.quiz_progress = QuizProgress.objects.filter(
            user=self.user_course,
            lesson_progress__lesson__id=self.kwargs['lesson_id'],
            quiz=lesson.quiz
        ).order_by('created_at').last()
        
        if(lesson.quiz == None):
            raise Http404
        return Question.objects.filter(quiz=lesson.quiz).order_by('created_at')


class LessonQuizQuestionDetail(generics.RetrieveAPIView):
    serializer_class = QuizQuestionDetailSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = None
    lookup_field = 'id'
    lookup_url_kwarg = 'question_id'

    def get_queryset(self):
        queryset = Lesson.objects.filter(course__id=self.kwargs['id'])
        filter_kwargs = {'id': self.kwargs['lesson_id']}
        lesson = get_object_or_404(queryset, **filter_kwargs)
        if(lesson.quiz == None):
            raise Http404
        return Question.objects.filter(quiz=lesson.quiz).order_by('created_at')
