from rest_framework import serializers
from quiz.models.attempt import Attempt
from quiz.models.question import Question
from quiz.models.test import Test
from django.contrib.contenttypes.models import ContentType

class TestQuestionBaseSerializer(serializers.ModelSerializer):
    answered = serializers.SerializerMethodField(read_only=True)

    def get_answered(self, obj) -> bool:
        answer = Attempt.objects.filter(
            content_type=ContentType.objects.get_for_model(Question),
            object_id=obj.id,
            user=self.context['request'].user
        )
        return answer.exists()

    class Meta:
        model = Question
        fields = ['id', 'answered']


class TestSerializer(serializers.ModelSerializer):
    lesson = serializers.StringRelatedField(read_only=True)
    question_ids = TestQuestionBaseSerializer(source="quiz_question", many=True, read_only=True)

    class Meta:
        model = Test
        fields = "__all__"
