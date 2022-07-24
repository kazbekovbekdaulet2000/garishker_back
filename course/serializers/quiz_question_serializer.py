from rest_framework import serializers
from course.models.quiz.question import Question
from course.serializers.quiz_question_answer_serializer import QuestionAnswerSerializer


class QuizQuestionSerializer(serializers.ModelSerializer):
    answer = serializers.SerializerMethodField(read_only=True)

    def get_answer(self, obj):
        return None

    class Meta:
        model = Question
        fields = ('id', 'question_kk', 'question_ru', 'point', 'answer')


class QuizQuestionDetailSerializer(serializers.ModelSerializer):
    answers = QuestionAnswerSerializer(read_only=True, many=True)

    class Meta:
        model = Question
        fields = ('id', 'question_kk', 'question_ru', 'point', 'answers')
