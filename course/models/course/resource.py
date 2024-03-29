from django.db import models
from django.utils.translation import gettext_lazy as _
from common.custom_model import AbstractModel
from common.s3_storage import S3Storage
from course.models.course.course import Course
from course.models.course.lesson import Lesson
from course.models.course.module import LessonModule


def course_dir(instance, filename):
    return f"course/course_{instance.course.id}/{filename}"

def course_resource(instance, filename):
    return f"course/course_{instance.course.id}/resource/{filename}"


class Resource(AbstractModel):
    name_kk = models.CharField(_('Название (каз)'), max_length=255, null=False)
    name_ru = models.CharField(_('Название (рус)'), max_length=255, null=False)
    description_kk = models.TextField(_('Описание (каз)'), blank=True)
    description_ru = models.TextField(_('Описание (рус)'), blank=True)
    course = models.ForeignKey(Course, related_name="resources", on_delete=models.CASCADE, null=True, blank=True)
    lesson = models.ForeignKey(Lesson, related_name="resources", on_delete=models.CASCADE, null=True, blank=True)
    lesson_module = models.ForeignKey(LessonModule, related_name="resources", on_delete=models.CASCADE, null=True, blank=True)
    file = models.FileField(_('Файл'), upload_to=course_dir, blank=True, storage=S3Storage)
    link = models.CharField(_('Ссылка'), blank=True, max_length=5000, null=True)
    image = models.FileField(_('Обложка'), upload_to=course_resource, blank=True)

    def __str__(self):
        return self.name_ru

    class Meta:
        ordering = ['-created_at']
        verbose_name = '[5] Ресурс'
        verbose_name_plural = '[5] Ресурсы'
