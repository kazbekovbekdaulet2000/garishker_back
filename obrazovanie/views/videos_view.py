from rest_framework import generics
from rest_framework import permissions
from obrazovanie.models.video import Video
from rest_framework.response import Response
from obrazovanie.serializers.video_serizializers import (
    BaseVideoSerializer, VideoDetailSerializer)
from obrazovanie.utils import VideoSearchFilter
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import pagination
from django.db.models import Q
from django.shortcuts import get_object_or_404


class CustomPagination(pagination.PageNumberPagination):
    page_size = 4
    page_size_query_param = 'page_size'
    max_page_size = 50


class VideoList(generics.ListAPIView):
    queryset = Video.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    serializer_class = BaseVideoSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = VideoSearchFilter
    pagination_class = CustomPagination


class RelatedVideoList(generics.ListAPIView):
    serializer_class = BaseVideoSerializer
    permission_classes = [permissions.AllowAny, ]

    def get_queryset(self):
        pk = self.kwargs['id']
        video = get_object_or_404(Video, id=pk)
        return Video.objects.filter(~Q(id=pk))


class VideoDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    queryset = Video.objects.all()
    serializer_class = VideoDetailSerializer

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.increase_views()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class VideoBookmarked(generics.ListAPIView):
    serializer_class = BaseVideoSerializer
    permission_classes = [permissions.IsAuthenticated, ]

    def get_queryset(self):
        return Video.objects.filter(saves__in=[self.request.user])


class VideoLiked(generics.ListAPIView):
    serializer_class = BaseVideoSerializer
    permission_classes = [permissions.IsAuthenticated, ]

    def get_queryset(self):
        return Video.objects.filter(likes__in=[self.request.user])
