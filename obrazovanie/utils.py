from django_filters import rest_framework as filters
from obrazovanie.models.report import Report
from obrazovanie.models.video import Video


class ReportLanguageFilter(filters.FilterSet):
    languages = filters.CharFilter(lookup_expr='icontains')

    class Meta:
        model = Report
        fields = ['languages', 'category']


class VideoLanguageFilter(filters.FilterSet):
    languages = filters.CharFilter(lookup_expr='icontains')

    class Meta:
        model = Video
        fields = ['languages', 'category']