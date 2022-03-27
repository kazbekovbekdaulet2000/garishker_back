from rest_framework import serializers
from quiz.models.attempt import Attempt
from quiz.models.answer import Answer
from quiz.models.question import Question
from quiz.models.test_result import TestResult
from quiz.serializers.answer_serizializer import TestQuestionAnswerSerializer
from django.contrib.contenttypes.models import ContentType


class TestQuestionSerializer(serializers.ModelSerializer):
    answers = TestQuestionAnswerSerializer(
        source="quiz_answer", many=True, read_only=True)
    user_answer = serializers.SerializerMethodField(read_only=True)

    def get_user_answer(self, obj):
        attempts = Attempt.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Question),
            object_id=obj.id
        )
        if(attempts.count() > 0):
            answer = attempts.last().selected_answer
            if(answer.id in list(obj.quiz_answer.answer_ids())):
                return answer.id
            else:
                return None
        return None

    class Meta:
        model = Question
        fields = ['id', 'title', 'point', 'user_answer', 'answers']


class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        exclude = ['is_right', ]
