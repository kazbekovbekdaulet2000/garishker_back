from rest_framework import serializers
from rest_framework.fields import empty
from course.models.progress.lesson_progress import LessonProgress
from course.models.progress.quiz_progress import QuizProgress

class LessonProgressSerializer(serializers.ModelSerializer):
    quiz_persantage = serializers.SerializerMethodField()

    def get_quiz_persantage(self, obj):
        if(obj.quiz):
            quizes = self.quiz_results.filter(quiz=obj.quiz, lesson_progress=obj)
            max = 0
            for quiz in quizes:
                progress = int(quiz.progress)
                if(max<progress):
                    max=progress
            return max
        return None

    quiz_results = None

    def __init__(self, instance=None, data=empty, **kwargs):
        super().__init__(instance, data, **kwargs)
        self.quiz_results = QuizProgress.objects.filter(
            user__user_id=self.context['request'].user.id,
            user__course_id=self.context['view'].kwargs['id']
        )

    class Meta:
        model = LessonProgress
        fields = ('id', 'lesson', 'quiz', 'quiz_persantage')
