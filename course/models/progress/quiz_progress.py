from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.custom_model import AbstractModel
from course.models.progress.course_user import CourseUser
from course.models.progress.lesson_progress import LessonProgress
from course.models.quiz.quiz import Quiz
from django.db.models.signals import post_save
from datetime import datetime


class QuizProgress(AbstractModel):
    user = models.ForeignKey(CourseUser, on_delete=models.CASCADE, null=True)
    lesson_progress = models.ForeignKey(LessonProgress, on_delete=models.CASCADE, related_name="quiz_attempts", null=True)
    quiz = models.ForeignKey(Quiz, on_delete=models.SET_NULL, null=True)
    attempt = models.PositiveIntegerField(default=1)
    completed = models.BooleanField(default=False)
    start_time = models.DateTimeField(null=True, blank=True)
    end_time = models.DateTimeField(null=True, blank=True)

    def finish(self):
        self.end_time = datetime.now()
        self.save()
    
    class Meta:
        ordering = ['-created_at']
        verbose_name = '[c] Прогресс в квизах'
        verbose_name_plural = '[c] Прогресс в квизах'

def change_lesson(sender, instance, created, **kwargs):
    pass


post_save.connect(change_lesson, sender=QuizProgress)