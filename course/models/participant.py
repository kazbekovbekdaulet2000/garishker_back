from django.db import models
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext_lazy as _
from django.db import models
from config.custom_model import AbstractModel
from course.models.course import Course
from course.models.lesson import Lesson
from user.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db.models.signals import post_save

class Participant(AbstractModel):
    user = models.ForeignKey(User, related_name='participation', on_delete=models.CASCADE, null=False, default=1)
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE, null=True)
    object_id = models.PositiveIntegerField(null=True)
    content_object = GenericForeignKey('content_type', 'object_id')
    points = models.PositiveIntegerField(default=0, validators=[MaxValueValidator(20), MinValueValidator(0)])
    max_points = models.PositiveIntegerField(default=0, validators=[MaxValueValidator(20), MinValueValidator(0)])
    success = models.BooleanField(default=False)
    access = models.BooleanField(default=False)
    
    def __str__(self):
        return self.user.email

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Участник'
        verbose_name_plural = 'Участники'

def create_user_participation(sender, instance, created, **kwargs):
    if(instance.content_type == ContentType.objects.get_for_model(Course)):
        course = get_object_or_404(Course, id=instance.object_id)
        first = True
        for lesson in course.course_lesson.all().order_by('order'):
            Participant.objects.create(
                user = instance.user,
                content_type = ContentType.objects.get_for_model(Lesson),
                object_id = lesson.id,
                max_points = lesson.score,
                access = first
            )
            first = False
        
post_save.connect(create_user_participation, sender=Participant)