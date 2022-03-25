from django.db import models
from django.utils.translation import gettext_lazy as _
from django.db import models
from config.custom_model import AbstractModel
from course.models.course import Course
from user.models import User
from django.core.validators import MaxValueValidator, MinValueValidator
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from django.db.models.signals import post_save
# Create your models here.


class Rating(AbstractModel):
    rating = models.PositiveIntegerField(default=1,
                                         validators=[MaxValueValidator(5), MinValueValidator(1)])
    body = models.TextField(blank=False, max_length=500, null=True)
    owner = models.ForeignKey(User,
                              related_name='rating', on_delete=models.CASCADE, null=False)
    content_type = models.ForeignKey(ContentType,
                                     on_delete=models.CASCADE, null=True)
    object_id = models.PositiveIntegerField(null=True)
    content_object = GenericForeignKey('content_type', 'object_id')
    likes = models.ManyToManyField(User,
                                   related_name='rating_likes', blank=True, default=[])

    def __str__(self):
        return self.owner.email

    class Meta:
        ordering = ['-created_at']
        verbose_name = 'Рейтинг'
        verbose_name_plural = 'Рейтинги'


def update_course(sender, instance, created, **kwargs):
    content_type = ContentType.objects.get_for_model(Course)
    if content_type == instance.content_type:
        course = Course.objects.get(id=instance.object_id)
        ratings = Rating.objects.filter(
            content_type=instance.content_type, object_id=course.id)
        sum = 0
        for item in ratings:
            sum +=item.rating
        course.rating = sum/len(ratings)
        course.save()
    else:
        print('err')


post_save.connect(update_course, sender=Rating)
