from django.contrib import admin
from projects.models.project import Project
from projects.models.project_periodic import ProjectPeriod
from projects.models.project_resourse import ProjectResource


class ProjectResourceAdmin(admin.TabularInline):
    model = ProjectResource
    extra = 0


class ProjectPeriodAdmin(admin.ModelAdmin):
    inlines = [ProjectResourceAdmin, ]


admin.site.register(Project)
admin.site.register(ProjectPeriod, ProjectPeriodAdmin)
