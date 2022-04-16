from django.contrib import admin
from event.models.event import City, Event


class EventAdmin(admin.ModelAdmin):
    def likes_count(self, obj):
        return obj.saves.count()

    list_display = ['name_ru', 'created_at', 'likes_count']
    ordering = ['-created_at']
    exclude = ('participants', 'saves')
    readonly_fields = ('views', 'participants',)


admin.site.register(Event, EventAdmin)
admin.site.register(City)
