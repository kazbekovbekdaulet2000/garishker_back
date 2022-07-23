from django.contrib import admin
from organizations.models import Organization
from course.models.course.course import Course


class OrganizationCourses(admin.TabularInline):
    model = Course
    extra = 0


class OrganizationAdmin(admin.ModelAdmin):
    inlines = [OrganizationCourses, ]


admin.site.register(Organization, OrganizationAdmin)
