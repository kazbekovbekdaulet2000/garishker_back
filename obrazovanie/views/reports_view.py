from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from obrazovanie.models import Report, Comment
from obrazovanie.serializers.comment_serizializers import ReportCommentCreateSerializer, ReportCommentSerializer
from obrazovanie.serializers.report_serizializers import BaseReportSerializer, ReportDetailSerializer

from obrazovanie.utils import ReportSearchFilter
from django_filters.rest_framework import DjangoFilterBackend


class ReportList(generics.ListAPIView):
    queryset = Report.objects.filter(moderated=True).order_by('-created_at')
    serializer_class = BaseReportSerializer
    permission_classes = [permissions.AllowAny, ]
    filter_backends = [DjangoFilterBackend]
    filterset_class = ReportSearchFilter


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


class ReportCommentList(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_serializer_class(self):
        if self.request.method == "POST":
            return ReportCommentCreateSerializer
        return ReportCommentSerializer

    def get_queryset(self):
        if not self.request:
            return Comment.objects.none()
        return Comment.objects.filter(report=self.kwargs['id'], reply__isnull=True).order_by('-created_at')


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


class ReportLike(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, *args, **kwargs):
        item = Report.objects.get(id=self.kwargs['id'])
        if(request.user in item.likes.all()):
            item.likes.remove(request.user)
            return Response({"liked": False}, status=status.HTTP_202_ACCEPTED)
        else:
            item.likes.add(request.user)
            return Response({"liked": True}, status=status.HTTP_202_ACCEPTED)


class ReportSave(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, *args, **kwargs):
        item = Report.objects.get(id=self.kwargs['id'])
        if(request.user in item.saves.all()):
            item.saves.remove(request.user)
            return Response(
                {"bookmarked": False}, status=status.HTTP_202_ACCEPTED)
        else:
            item.saves.add(request.user)
            return Response(
                {"bookmarked": True}, status=status.HTTP_202_ACCEPTED)
