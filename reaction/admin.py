from django.contrib import admin
from reaction.models.bookmark import Bookmark

from reaction.models.comment import Comment
from reaction.models.like import Like
from reaction.models.review import Review


class GenericAdmin(admin.ModelAdmin):
    def has_add_permission(self, request, obj=None):
        return False

    def has_change_permission(self, request, obj=None):
        return False
    list_display = ('id', 'owner', 'content_object')
    readonly_fields = ('likes_count', 'comments_count',
                       'reviews_count', 'bookmarks_count')


class GenericBaseAdmin(admin.ModelAdmin):
    def has_add_permission(self, request, obj=None):
        return False

    def has_change_permission(self, request, obj=None):
        return False

    def has_delete_permission(self, request, obj=None) -> bool:
        return False
    
    list_display = ('id', 'owner', 'content_object')


admin.site.register(Comment, GenericAdmin)
admin.site.register(Like, GenericBaseAdmin)
admin.site.register(Review, GenericAdmin)
admin.site.register(Bookmark, GenericBaseAdmin)
