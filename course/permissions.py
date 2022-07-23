from rest_framework import permissions


class LessonAvailable(permissions.BasePermission):
    def has_permission(self, request, view):
        if permissions.IsAuthenticated:
            return True
        return False

    def has_object_permission(self, request, view, obj):
        res = True
        return res
