from django_filters import CharFilter
from django_filters import rest_framework
from course.models.course import Course


class CourseSearchFilter(rest_framework.FilterSet):
    name_ru = CharFilter(lookup_expr='icontains')
    name_kk = CharFilter(lookup_expr='icontains')

    class Meta:
        model = Course
        fields = ['name_ru', 'name_kk', 'category']
