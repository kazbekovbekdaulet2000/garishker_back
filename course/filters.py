from course.models.course.course import Course
from django_filters import rest_framework as filters

class CourseLanguageFilter(filters.FilterSet):
    languages = filters.CharFilter(lookup_expr='icontains')

    class Meta:
        model = Course
        fields = ['languages', 'category']