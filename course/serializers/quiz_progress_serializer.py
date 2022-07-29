from django.forms import ValidationError
from django.http import Http404
from django.shortcuts import get_object_or_404
from rest_framework import serializers
from course.models.course.course import Course
from course.models.course.lesson import Lesson
from course.models.progress.course_user import CourseUser
from course.models.progress.lesson_progress import LessonProgress
from course.models.progress.quiz_progress import QuizProgress
import datetime


class QuizProgressSerializer(serializers.ModelSerializer):
    user_course = None
    user_lesson = None
    quiz = None
    start_time = datetime.datetime.now()

    class Meta:
        model = QuizProgress
        fields = ('id', 'user', 'lesson_progress', 'quiz',
                  'attempt', 'completed', 'start_time', 'end_time', 'progress')
        read_only_fields = ('user', 'lesson_progress', 'quiz',
                            'attempt', 'completed', 'start_time', 'end_time', 'progress')

    def validate(self, attrs):
        course_id = self.context.get('view').kwargs['id']
        lesson_id = self.context.get('view').kwargs['lesson_id']
        user = self.context.get('request').user
        course = get_object_or_404(Course, id=course_id)
        lesson = get_object_or_404(Lesson, id=lesson_id)

        self.user_course = get_object_or_404(CourseUser, **{
            'user': user,
            'course': course
        })
        self.user_lesson = get_object_or_404(LessonProgress, **{
            'lesson': lesson,
            'user': self.user_course,
            'quiz': lesson.quiz
        })

        self.quiz = lesson.quiz

        if(not self.quiz):
            raise Http404

        self.attempt = QuizProgress.objects.filter(user=self.user_course, lesson_progress=self.user_lesson,
                                                   quiz=self.quiz, end_time__isnull=False).count() + 1
        if(self.attempt > self.quiz.default_attempts_count):
            self.user_lesson.completed = True
            self.user_lesson.save()
            raise ValidationError('no more attempts')

        return super().validate(attrs)

    def create(self, validated_data):
        validated_data.update({'user': self.user_course})
        validated_data.update({'lesson_progress': self.user_lesson})
        validated_data.update({'quiz': self.quiz})
        validated_data.update({'attempt': self.attempt})
        validated_data.update({'start_time': self.start_time})
        instance, created = QuizProgress.objects.get_or_create(
            **validated_data)
        return instance
