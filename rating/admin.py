from django.contrib import admin
from rating.models import Rating


class RatingAdmin(admin.ModelAdmin):
    list_display = ['rating', 'owner', 'created_at']
    ordering = ['rating', 'owner']
    readonly_fields = ('content_type', 'object_id', 'likes')
    list_filter = ['created_at', 'content_type']
    search_fields = ['body']


admin.site.register(Rating, RatingAdmin)
