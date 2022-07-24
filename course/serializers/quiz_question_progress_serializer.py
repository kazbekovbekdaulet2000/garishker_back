from django.http import Http404
from django.forms import ValidationError
from django.shortcuts import get_object_or_404
from rest_framework import serializers
from course.models.course.course import Course
from course.models.course.lesson import Lesson
from course.models.progress.course_user import CourseUser
from course.models.progress.lesson_progress import LessonProgress
from course.models.progress.question_progress import QuizQuestionProgress
from course.models.progress.quiz_progress import QuizProgress
from course.models.quiz.question import Question


class QuizQuestionProgressSerializer(serializers.ModelSerializer):
    user_course = None
    question = None
    point = None
    quiz_progress = None
    correct = None

    class Meta:
        model = QuizQuestionProgress
        fields = ('id', 'question', 'answer')
        read_only_fields = ('question',)

    def validate(self, attrs):
        course_id = self.context.get('view').kwargs['id']
        lesson_id = self.context.get('view').kwargs['lesson_id']
        question_id = self.context.get('view').kwargs['question_id']
        user = self.context.get('request').user
        course = get_object_or_404(Course, id=course_id)
        lesson = get_object_or_404(Lesson, id=lesson_id)
        self.user_course = get_object_or_404(CourseUser, **{
            'user': user,
            'course': course
        })
        self.question = get_object_or_404(Question, id=question_id)
        self.quiz_progress = QuizProgress.objects.filter(
            user=self.user_course, lesson_progress__lesson=lesson, end_time__isnull=True).order_by('created_at').last()
        
        if(self.quiz_progress == None):
            raise Http404

        answer = attrs.get('answer')
        if(not answer):
            raise ValidationError('answer')
        answer_ids = self.question.answers.values_list('id', flat=True)
        if(not answer.id in answer_ids):
            raise ValidationError('answer')
        
        self.correct = answer.correct

        if(self.correct):
            self.point = self.question.point
        else:
            self.point = 0
        return super().validate(attrs)

    def create(self, validated_data):
        validated_data.update({'user': self.user_course})
        validated_data.update({'quiz_progress': self.quiz_progress})
        validated_data.update({'question': self.question})
        validated_data.update({'point': self.point})
        validated_data.update({'correct': self.correct})
        instance, created = QuizQuestionProgress.objects.update_or_create(
            user=self.user_course, quiz_progress=self.quiz_progress, question=self.question,
            defaults=validated_data,
        )
        return instance
