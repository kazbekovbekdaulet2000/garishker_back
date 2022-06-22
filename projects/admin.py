from django.contrib import admin
from projects.models.project import Project
from projects.models.project_periodic import ProjectPeriod


class ProjectPeriodAdmin(admin.TabularInline):
    model = ProjectPeriod
    extra = 0


class ProjectAdmin(admin.ModelAdmin):
    inlines = [ProjectPeriodAdmin, ]


admin.site.register(Project, ProjectAdmin)
admin.site.register(ProjectPeriod)
