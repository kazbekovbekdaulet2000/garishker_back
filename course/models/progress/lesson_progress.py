from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.custom_model import AbstractModel
from course.models.course.lesson import Lesson
from course.models.progress.course_user import CourseUser
from django.db.models.signals import post_save
from course.models.quiz.quiz import Quiz

class LessonProgress(AbstractModel):
    user = models.ForeignKey(CourseUser, on_delete=models.CASCADE, related_name="progress_lessons", null=False)
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE, null=False)
    quiz = models.ForeignKey(Quiz, on_delete=models.SET_NULL, null=True, blank=True)
    completed = models.BooleanField(default=False)
    current = models.BooleanField(default=False)

    def save(self, **kwargs):
        self.quiz = self.lesson.quiz
        return super().save(**kwargs)
    
    class Meta:
        ordering = ['-created_at']
        verbose_name = '[b] Прогресс в уроках'
        verbose_name_plural = '[b] Прогресс в уроках'

def change_lesson(sender, instance, created, **kwargs):
    user_course = instance.user
    prev_lesson = instance.lesson
    if(instance.completed and instance.current):
        lesson = Lesson.objects.filter(order__gt=prev_lesson.order).order_by('order').first()
        if(user_course.completed):
            return
        if(user_course.current_lesson == lesson):
            user_course.completed = True
        if(lesson == None):
            user_course.completed = True
        else:
            user_course.current_lesson = lesson
        user_course.save()


post_save.connect(change_lesson, sender=LessonProgress)