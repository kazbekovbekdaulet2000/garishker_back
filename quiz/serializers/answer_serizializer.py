from rest_framework import serializers
from quiz.models.answer import Answer


class TestQuestionAnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ['id', 'answer_text']


class TestQuestionAnswerDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = "__all__"
