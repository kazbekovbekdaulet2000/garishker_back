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
        answers = self.answers.all()
        answers = answers.values_list('point', flat=True)
        persentage = sum(list(answers))/self.quiz.max_points * 100
        accepted_persentage = persentage > self.quiz.default_pass_percentage
        attempt = self.quiz.default_attempts_count >= self.attempt
        if(accepted_persentage and attempt):
            self.completed = True
        self.save()

    @property
    def progress(self):
        if(self.end_time):
            answers = self.answers.filter(correct=True)
            max_points = self.quiz.max_points
            points = sum(list(answers.values_list('point', flat=True)))
            if(points == 0):
                return 0
            else:
                return int(points/max_points * 100)
        else:
            return 0

    class Meta:
        ordering = ['-created_at']
        verbose_name = '[c] Прогресс в квизах'
        verbose_name_plural = '[c] Прогресс в квизах'


def change_lesson(sender, instance, created, **kwargs):
    lesson_progress = instance.lesson_progress
    lesson_progress.completed = instance.completed
    lesson_progress.save()


post_save.connect(change_lesson, sender=QuizProgress)
