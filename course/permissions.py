from django.shortcuts import get_object_or_404
from rest_framework import permissions
from course.models.progress.course_user import CourseUser

from course.models.progress.lesson_progress import LessonProgress


class LessonAvailable(permissions.BasePermission):
    def has_permission(self, request, view):
        if permissions.IsAuthenticated:
            return True
        return False

    def has_object_permission(self, request, view, obj):
        course_id = view.kwargs[view.lookup_field]
        lesson_progress = get_object_or_404(LessonProgress, **{
            'lesson_id': obj.id,
            'user__user_id': request.user.id,
            'user__course_id': course_id
        })
        return lesson_progress.current or lesson_progress.completed


class CourseParticipant(permissions.BasePermission):
    def has_permission(self, request, view):
        return CourseUser.objects.filter(course_id=view.kwargs['id'], user=request.user).exists()
