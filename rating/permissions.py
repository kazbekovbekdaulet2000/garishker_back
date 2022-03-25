from rest_framework import permissions


class IsRatingOwnerOrAdmin(permissions.BasePermission):
    edit_methods = ("POST", "PUT", "PATCH", "DELETE")

    def has_permission(self, request, view):
        if permissions.IsAuthenticated:
            return True
        return False

    def has_object_permission(self, request, view, obj):
        if obj.owner.id == request.user.id or request.user.is_superuser:
            return True
        return False
