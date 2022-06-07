from re import S
from django.contrib import admin
from video.models.video_quality_item import VideoQualityURL

from video.models.video_url import VideoURL
from video.tasks import video_transcode
# video_transcode.delay(self.id, self.url)


@admin.action(description='Конвертировать видео')
def convert_video(modeladmin, request, queryset):
    for query in queryset:
        if(query.convert_status in ['pending', 'error']):
            if(query.video_file):
                url = str(query.video_file.url).split("?")[0] 
            elif(query.url): 
                url = str(query.url)
            if url:
                video_transcode.delay(query.id, url)
            else: 
                query.convert_status = 'error'
                query.save()


class VideoQualityURLAdmin(admin.TabularInline):
    model = VideoQualityURL
    extra = 0

class VideoURLAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'url_type', 'convert_status')
    ordering = ('-created_at',)
    readonly_fields = ('convert_status', 'duriation', 'original_quality')
    actions = [convert_video]
    inlines = [VideoQualityURLAdmin, ]


admin.site.register(VideoURL, VideoURLAdmin)