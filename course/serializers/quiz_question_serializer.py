from rest_framework import serializers
from course.models.progress import question_progress
from course.models.progress.question_progress import QuizQuestionProgress
from course.models.quiz.question import Question
from course.serializers.quiz_question_answer_serializer import QuestionAnswerSerializer


class QuizQuestionSerializer(serializers.ModelSerializer):
    answer = serializers.SerializerMethodField(read_only=True)
    last_answer = serializers.SerializerMethodField(read_only=True)

    def get_answer(self, obj):
        return QuizQuestionProgress.objects.filter(
            user=self.context['view'].user_course,
            quiz_progress=self.context['view'].quiz_progress,
            question_id=obj.id
        ).exists()

    def get_last_answer(self, obj):
        question_progress = QuizQuestionProgress.objects.filter(
            user=self.context['view'].user_course,
            quiz_progress=self.context['view'].quiz_progress,
            question_id=obj.id
        ).last()

        if(question_progress):
            return QuestionAnswerSerializer(question_progress.answer, many=False).data
        return None

    class Meta:
        model = Question
        fields = ('id', 'question_kk', 'question_ru', 'point', 'answer', 'last_answer')


class QuizQuestionDetailSerializer(serializers.ModelSerializer):
    answers = QuestionAnswerSerializer(read_only=True, many=True)

    class Meta:
        model = Question
        fields = ('id', 'question_kk', 'question_ru', 'point', 'answers')
