from rest_framework import serializers
from quiz.models.test import Test
from quiz.models.answer import Answer
from quiz.models.question import Question
from quiz.serializers.answer_serizializer import TestQuestionAnswerSerializer


class TestQuestionSerializer(serializers.ModelSerializer):
    answers = TestQuestionAnswerSerializer(source="quiz_answer", many=True, read_only=True)
    
    class Meta:
        model = Question
        fields = ['id', 'title', 'point', 'answers']


class TestSerializer(serializers.ModelSerializer):
    lesson = serializers.StringRelatedField(read_only=True)
    question_ids =  serializers.PrimaryKeyRelatedField(source="quiz_question", many=True, read_only=True)

    class Meta:
        model = Test
        fields = "__all__"


class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        exclude = ['is_right', ]
