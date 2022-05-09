from django.contrib import admin
from obrazovanie.models.category import Category
from obrazovanie.models.report import Report
from obrazovanie.models.video import Video
from obrazovanie.tasks import video_resize_yandex_storage
from shop.admin import GenericReactionAdmin


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


class ReportAdmin(GenericReactionAdmin):
    list_display = ['title_ru', 'moderated', 'created_at',
                    'likes_count', 'comments_count', 'bookmarks_count', 'views']
    ordering = ['-created_at', '-updated_at']
    actions = [make_published]
    exclude = ('reviews_count',)
    readonly_fields = GenericReactionAdmin.readonly_fields + \
        ('views', 'read_time',)


class VideoAdmin(admin.ModelAdmin):
    list_display = ['title_ru', 'created_at', 'convert_status',
                    'likes_count', 'comments_count', 'bookmarks_count', 'views']
    ordering = ['-created_at']
    actions = [convert_video]
    exclude = ('reviews_count',)
    readonly_fields = GenericReactionAdmin.readonly_fields + \
        ('views', 'video_quality', 'original_quality', 'convert_status', 'video')


admin.site.register(Category)
admin.site.register(Report, ReportAdmin)
admin.site.register(Video, VideoAdmin)
