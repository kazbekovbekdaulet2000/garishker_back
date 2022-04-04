from django.contrib import admin
from obrazovanie.models.category import Category
from obrazovanie.models.comment import Comment
from obrazovanie.models.report import Report
from obrazovanie.models.video import Video
from obrazovanie.tasks import video_resize_yandex_storage


class ReportAdmin(admin.ModelAdmin):
    list_display = []


@admin.action(description='Активация поста')
def make_published(modeladmin, request, queryset):
    queryset.update(moderated=True)


@admin.action(description='Конвертировать видео')
def convert_video(modeladmin, request, queryset):
    for query in queryset:
        if(not (query.youtube == None or query.youtube == '')):
            video_resize_yandex_storage.delay(query.id, query.video_name)


class ReportAdmin(admin.ModelAdmin):
    def likes_count(self, obj):
        return obj.likes.count()

    list_display = ['title_ru', 'moderated', 'created_at']
    ordering = ['-created_at', '-updated_at']
    actions = [make_published]
    exclude = ('likes', 'saves')
    readonly_fields = ('views', 'read_time',)


class VideoAdmin(admin.ModelAdmin):
    def likes_count(self, obj):
        return obj.likes.count()

    list_display = ['title_ru', 'created_at', 'convert_status']
    ordering = ['-created_at']
    actions = [convert_video]
    exclude = ('likes', 'saves')
    readonly_fields = ('views', 'video_quality',
                       'original_quality', 'convert_status', 'video')

    # def save_model(self, request, obj, form, change):
    #     if not obj.author:
    #         obj.author = request.user
    #     obj.last_modified_by = request.user
    #     obj.save()


class CommentAdmin(admin.ModelAdmin):
    list_display = ['body', 'owner', 'created_at', 'content_type', 'object_id']
    ordering = ['-created_at', '-owner']
    readonly_fields = ('content_type', 'object_id', 'owner', 'likes', 'reply')
    search_fields = ['body']
    list_filter = ['content_type', ]


admin.site.register(Category)
admin.site.register(Report, ReportAdmin)
admin.site.register(Video, VideoAdmin)
admin.site.register(Comment, CommentAdmin)
