from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from rest_framework.response import Response
from rest_framework import status
from course.models.course.course import Course
from course.models.course.lesson import Lesson
from course.models.progress.course_user import CourseUser
from course.models.progress.lesson_progress import LessonProgress
from course.models.progress.quiz_progress import QuizProgress
from course.serializers.quiz_progress_serializer import QuizProgressSerializer
from django.http import Http404


class LessonQuizFinish(generics.CreateAPIView):
    serializer_class = QuizProgressSerializer
    permission_classes = (permissions.IsAuthenticated, )
    user_course = None
    user_lesson = None
    quiz = None

    def create(self, request, *args, **kwargs):
        course_id = self.kwargs['id']
        lesson_id = self.kwargs['lesson_id']
        course = get_object_or_404(Course, id=course_id)
        lesson = get_object_or_404(Lesson, id=lesson_id)
       
        self.user_course = get_object_or_404(CourseUser, **{
            'user': request.user,
            'course': course
        })
        self.user_lesson = get_object_or_404(LessonProgress, **{
            'lesson': lesson,
            'user': self.user_course,
            'quiz': lesson.quiz
        })
        
        self.quiz = lesson.quiz
        quiz = QuizProgress.objects.filter(user=self.user_course, lesson_progress=self.user_lesson, quiz=self.quiz, end_time__isnull=True).order_by('created_at').last()
        
        if(quiz == None):
            raise Http404
        quiz.finish()
        serializer = QuizProgressSerializer(quiz, many=False)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)