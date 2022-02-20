from unicodedata import category
from rest_framework import generics
from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from obrazovanie.models.comment import Comment

from obrazovanie.models.report import Report
from obrazovanie.serializers.comment_serizializers import CommentCreateSerializer, CommentSerializer
from obrazovanie.serializers.report_serizializers import BaseReportSerializer, ReportDetailSerializer

from obrazovanie.utils import ReportSearchFilter
from django_filters.rest_framework import DjangoFilterBackend
from django.contrib.contenttypes.models import ContentType
from django.db.models import Q
from django.shortcuts import get_object_or_404


class ReportList(generics.ListAPIView):
    queryset = Report.objects.filter(moderated=True).order_by('-created_at')
    serializer_class = BaseReportSerializer
    permission_classes = [permissions.AllowAny, ]
    filter_backends = [DjangoFilterBackend]
    filterset_class = ReportSearchFilter


class RelatedReportList(generics.ListAPIView):
    serializer_class = BaseReportSerializer
    permission_classes = [permissions.AllowAny, ]

    def get_queryset(self):
        pk = self.kwargs['id']
        report = get_object_or_404(Report, id=pk)
        return Report.objects.filter(~Q(id=pk), moderated=True).order_by('-views')


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
        return Report.objects.filter(moderated=True, saves__in=[self.request.user])


class ReportLiked(generics.ListAPIView):
    serializer_class = BaseReportSerializer
    permission_classes = [permissions.IsAuthenticated, ]

    def get_queryset(self):
        return Report.objects.filter(moderated=True, likes__in=[self.request.user])
