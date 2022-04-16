from django.forms import ValidationError
from rest_framework import serializers
from quiz.models.attempt import Attempt
from quiz.models.question import Question
from django.contrib.contenttypes.models import ContentType
from django.shortcuts import get_object_or_404


class TestAttemptCreateSerializer(serializers.ModelSerializer):
    question = None

    class Meta:
        model = Attempt
        fields = ['id', 'selected_answer', 'attempt_num']
        read_only_fields = ['attempt_num']

    def validate(self, attrs):
        self.question = get_object_or_404(
            Question, id=self.context['view'].kwargs['question_id'])
        answer_id = attrs['selected_answer'].id
        proper_list = list(self.question.quiz_answer.answer_ids())
        if(answer_id in proper_list):
            return super().validate(attrs)
        raise ValidationError("Ответ не найден в списке ответов")

    def create(self, validated_data):
        validated_data['content_type'] = ContentType.objects.get_for_model(Question)
        validated_data['object_id'] = self.context['view'].kwargs.get('question_id')
        validated_data['user'] = self.context['request'].user
        validated_data['attempt_num'] = self.context['view'].attempt_num
        validated_data['is_correct'] = False

        if(self.question.quiz_answer.correct_answer() == validated_data['selected_answer']):
            validated_data['is_correct'] = True
        answer = Attempt.objects.filter(
            object_id=self.context['view'].kwargs.get('question_id'),
            user=self.context['request'].user,
            attempt_num = self.context['view'].attempt_num
        )
        if(answer.exists()):
            return self.update(answer.last(), validated_data)
        return super().create(validated_data)
