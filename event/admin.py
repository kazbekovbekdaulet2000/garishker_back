from django.contrib import admin
from event.models.country import Country
from event.models.event import Event
from event.models.city import City
from event.models.event_registration import EventRegistration


class EventRegistrationAdmin(admin.ModelAdmin):
    list_display = ['email', 'event', 'created_at']
    list_filter = ['event', ]


class EventAdmin(admin.ModelAdmin):
    def likes_count(self, obj):
        return obj.saves.count()

    list_display = ['name_ru', 'created_at', 'likes_count']
    ordering = ['-created_at']
    exclude = ('saves',)
    readonly_fields = ('views',)


admin.site.register(Event, EventAdmin)
admin.site.register(EventRegistration, EventRegistrationAdmin)
admin.site.register(City)
admin.site.register(Country)
