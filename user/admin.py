from django.contrib import admin
from .models import *


class UserAdmin(admin.ModelAdmin):
    list_display = ['email', 'name', 'surname', 'created_at']
    ordering = ['-created_at']
    readonly_fields = ('email', 'name', 'surname', 'birth_date',
                       'image', 'city', 'description', 'user_type')


admin.site.register(User, UserAdmin)
