from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from course.models.course.course import Course
from course.models.course.lesson import Lesson
from course.models.progress.course_user import CourseUser
from course.models.progress.lesson_progress import LessonProgress
from course.models.progress.quiz_progress import QuizProgress
from course.serializers.quiz_progress_serializer import QuizProgressSerializer


class LessonQuizAttemptList(generics.ListAPIView):
    serializer_class = QuizProgressSerializer
    permission_classes = (permissions.IsAuthenticated, )
    pagination_class = None
    
    def get_queryset(self):
        course_id = self.kwargs['id']
        lesson_id = self.kwargs['lesson_id']
        course = get_object_or_404(Course, id=course_id)
        lesson = get_object_or_404(Lesson, id=lesson_id)
        user_course = get_object_or_404(CourseUser, **{
            'user': self.request.user,
            'course': course
        })
        user_lesson = get_object_or_404(LessonProgress, **{
            'lesson': lesson,
            'user': user_course,
            'quiz': lesson.quiz
        })
        return QuizProgress.objects.filter(user=user_course, lesson_progress=user_lesson, quiz=lesson.quiz).order_by('created_at')
