# obj.course_lesson.all():

from rest_framework import permissions
from course.models.lesson import Lesson
from course.models.participant import Participant
from django.contrib.contenttypes.models import ContentType


class LessonAvailable(permissions.BasePermission):
    def has_permission(self, request, view):
        if permissions.IsAuthenticated:
            return True
        return False

    def has_object_permission(self, request, view, obj):
        lessons = obj.course.course_lesson.all().order_by('order')
        res = True
        for lesson in lessons:
            if(lesson.id == obj.id):
                break
            res = Participant.objects.filter(
                user=request.user,
                content_type=ContentType.objects.get_for_model(Lesson),
                object_id=lesson.id).count() > 0
        return res
