from xml.etree.ElementInclude import include
from attr import fields
from django.contrib import admin
from .models import *


class ReportAdmin(admin.ModelAdmin):
    list_display = []


@admin.action(description='Активация поста')
def make_published(queryset):
    queryset.update(moderated=True)


class ReportAdmin(admin.ModelAdmin):
    def likes_count(self, obj):
        return obj.likes.count()

    list_display = ['title', 'moderated', 'created_at']
    ordering = ['title', 'created_at', 'updated_at']
    actions = [make_published]
    exclude = ('likes', 'saves')


class CommentAdmin(admin.ModelAdmin):
    list_display = ['body', 'report', 'owner', 'created_at']
    ordering = ['body', 'report', 'created_at', 'owner']


admin.site.register(Category)
admin.site.register(Report, ReportAdmin)
admin.site.register(Comment, CommentAdmin)
admin.site.register(VideoComment)
admin.site.register(Video)
