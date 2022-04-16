from django.forms import ValidationError
from rest_framework import serializers
from quiz.models.attempt import Attempt
from quiz.models.question import Question
from quiz.models.test import Test
from quiz.models.test_result import TestResult
from django.shortcuts import get_object_or_404
from django.contrib.contenttypes.models import ContentType


class TestResultAnswersSerializer(serializers.ModelSerializer):
    correct = serializers.SerializerMethodField(read_only=True)

    def get_correct(self, obj) -> bool:
        attempt = Attempt.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Question),
            object_id=obj.id
        )
        return attempt.first().is_correct

    class Meta:
        model = Question
        fields = ['id', 'correct', 'point']


class TestResultSerializer(serializers.ModelSerializer):
    percentage = serializers.SerializerMethodField(read_only=True)
    answers = TestResultAnswersSerializer(
        source='test.quiz_question', read_only=True, many=True)

    def get_percentage(self, obj) -> str:
        return "%.2f" % (obj.points / obj.max_points * 100) + '%'

    class Meta:
        model = TestResult
        fields = ['id', 'created_at', 'percentage',
                  'points', 'max_points', 'attempt_num', 'test', 'answers']
        extra_fields = {
            'percentage': {'read_only': True}
        }


class TestResultCreateSerializer(serializers.ModelSerializer):
    test = None
    q_ids = []
    percentage = serializers.SerializerMethodField(read_only=True)
    answers = TestResultAnswersSerializer(
        source='test.quiz_question', read_only=True, many=True)

    def get_percentage(self, obj) -> str:
        return "%.2f" % (obj.points / obj.max_points * 100) + '%'

    class Meta:
        model = TestResult
        fields = ['id', 'created_at', 'percentage',
                  'points', 'max_points', 'attempt_num', 'test', 'answers']
        extra_fields = {
            'percentage': {'read_only': True},
        }
        read_only_fields = ['created_at', 'percentage',
                            'points', 'max_points', 'attempt_num', 'test', 'answers']

    def validate(self, attrs):
        self.test = get_object_or_404(
            Test,
            id=self.context['view'].kwargs.get('test_id')
        )

        if(self.test.quiz_question.all().count() == 0):
            raise ValidationError('Пока невозможно сдать тест')

        if(TestResult.objects.filter(
            test=self.test,
            user=self.context['request'].user,
            attempt_num=self.context['view'].attempt_num
        ).exists()):
            raise ValidationError('Результаты уже есть')

        self.q_ids = list(self.test.quiz_question.filter(
            is_active=True).values_list('id', flat=True))

        attempts = Attempt.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Question),
            object_id__in=self.q_ids,
            attempt_num=self.context['view'].attempt_num
        )
        if(not len(attempts) == len(self.q_ids)):
            raise ValidationError('Не все тесты не отвечены')

        return attrs

    def create(self, validated_data):
        points = 0
        
        attempts = Attempt.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Question),
            object_id__in=self.q_ids,
            attempt_num=self.context['view'].attempt_num
        )

        for attempt in attempts:
            if(attempt.is_correct):
                points += attempt.content_object.point

        validated_data['max_points'] = self.test.quiz_question.max_points()
        validated_data['points'] = points
        validated_data['test'] = self.test
        validated_data['user'] = self.context['request'].user
        return super().create(validated_data)

    def update(self, instance, validated_data):
        return super().update(instance, validated_data)
