from rest_framework import serializers
from course.models.quiz.quiz import Quiz

class QuizSerializer(serializers.ModelSerializer):
    class Meta:
        model = Quiz
        fields = "__all__"

