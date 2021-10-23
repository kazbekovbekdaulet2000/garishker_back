from django.contrib import admin
from .models import *


class SectionAdmin(admin.ModelAdmin):
    list_display = ('name', 'created_date', 'updated_date')

admin.site.register(Category)
admin.site.register(Section, SectionAdmin)
admin.site.register(Report)
admin.site.register(Comment)
admin.site.register(Video)
