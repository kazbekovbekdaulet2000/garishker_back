from rest_framework import serializers
from quiz.models.test import Test
from quiz.models.answer import Answer
from quiz.models.question import Question


class TestSerializer(serializers.ModelSerializer):
    lesson = serializers.StringRelatedField(read_only=True)
    question_count = serializers.SerializerMethodField(read_only=True)

    def get_question_count(self, obj) -> int:
        return obj.quiz_question.all().count()

    class Meta:
        model = Test
        fields = "__all__"


class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        exclude = ['is_right', ]
