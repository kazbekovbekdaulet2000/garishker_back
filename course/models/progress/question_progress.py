from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.custom_model import AbstractModel
from django.core.validators import MaxValueValidator
from course.models.progress.course_user import CourseUser
from course.models.progress.quiz_progress import QuizProgress
from course.models.quiz.answer import Answer
from course.models.quiz.question import Question


class QuizQuestionProgress(AbstractModel):
    user = models.ForeignKey(CourseUser, on_delete=models.CASCADE, related_name="my_answers", null=False)
    quiz_progress = models.ForeignKey(QuizProgress, on_delete=models.CASCADE, related_name="answers", null=True)
    question = models.ForeignKey(Question, on_delete=models.SET_NULL, null=True)
    answer = models.ForeignKey(Answer, on_delete=models.SET_NULL, null=True)
    correct = models.BooleanField()
    point = models.PositiveIntegerField(validators=(MaxValueValidator(5),))

    class Meta:
        ordering = ['-created_at']
        verbose_name = '[d] Прогресс в вопросах'
        verbose_name_plural = '[d] Прогресс в вопросах'