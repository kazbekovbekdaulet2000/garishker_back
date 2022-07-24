from rest_framework import serializers
from course.models.quiz.answer import Answer


class QuestionAnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ('id', 'answer_kk', 'answer_ru')