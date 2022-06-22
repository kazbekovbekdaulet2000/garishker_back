from rest_framework import generics
from rest_framework import permissions
from rest_framework.response import Response
from obrazovanie.models.report import Report
from obrazovanie.serializers.report_serizializers import BaseReportSerializer, ReportDetailSerializer
from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Q
from rest_framework.filters import SearchFilter
from obrazovanie.utils import ReportLanguageFilter


class ReportList(generics.ListAPIView):
    queryset = Report.objects.filter(moderated=True).order_by('-created_at')
    serializer_class = BaseReportSerializer
    permission_classes = [permissions.AllowAny, ]
    filter_backends = [DjangoFilterBackend, SearchFilter]
    search_fields = (
        'title_ru', 'title_kk', 'category__name_ru',
        'category__name_kk', 'tags', 'preview_text_ru',
        'preview_text_kk'
    )
    filterset_class = ReportLanguageFilter


class RelatedReportList(generics.ListAPIView):
    serializer_class = BaseReportSerializer
    permission_classes = [permissions.AllowAny, ]

    def get_queryset(self):
        pk = self.kwargs['id']
        return Report.objects.filter(~Q(id=pk), moderated=True)


class ReportDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    queryset = Report.objects.all()
    serializer_class = ReportDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.increase_views()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class ReportBookmarked(generics.ListAPIView):
    serializer_class = BaseReportSerializer
    permission_classes = [permissions.IsAuthenticated, ]

    def get_queryset(self):
        return Report.objects.list_bookmarked(self.request.user)


class ReportLiked(generics.ListAPIView):
    serializer_class = BaseReportSerializer
    permission_classes = [permissions.IsAuthenticated, ]

    def get_queryset(self):
        return Report.objects.list_liked(self.request.user)
