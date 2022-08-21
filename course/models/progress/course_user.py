from email.policy import default
from django.db import models
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _
from django.db import models
from common.custom_model import AbstractModel
from django.contrib.auth import get_user_model
from course.models.course.course import Course
from course.models.course.lesson import Lesson
from django.db.models.signals import post_save

User = get_user_model()


class CourseUser(AbstractModel):
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING, related_name="courses", null=False)
    course = models.ForeignKey(Course, on_delete=models.DO_NOTHING, related_name='users', null=False)
    current_lesson = models.ForeignKey(Lesson, on_delete=models.SET_NULL, null=True)
    completed = models.BooleanField(default=False)

    @property
    def progress(self) -> int: 
        # if(self.completed):
        #     lessons = self.progress_lessons.filter(completed=True)
        #     attempts = lessons.values_list('quiz_attempts')
        #     print(attempts)
        return 0

    def __str__(self):
        return f"{self.user.email} - {self.course.name_ru}"

    class Meta:
        ordering = ['-created_at']
        verbose_name = '[a] Прогресс в курсе'
        verbose_name_plural = '[a] Прогресс в курсе'


def create_lesson_progress(sender, instance, created, **kwargs):
    course_lessons = instance.course.lessons.all()
    for lesson in course_lessons:
        current = instance.current_lesson == lesson
        instance.progress_lessons.update_or_create(
            user=instance, lesson=lesson, quiz=lesson.quiz,
            defaults={'current': current}
        )


post_save.connect(create_lesson_progress, sender=CourseUser)
