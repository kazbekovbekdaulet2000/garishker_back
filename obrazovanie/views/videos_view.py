from rest_framework import generics
from rest_framework import permissions
from rest_framework import status
from obrazovanie.models.comment import Comment
from obrazovanie.models.video import Video
from rest_framework.views import APIView
from rest_framework.response import Response
from obrazovanie.serializers.comment_serizializers import CommentCreateSerializer, CommentSerializer
from obrazovanie.serializers.video_serizializers import (
    BaseVideoSerializer, VideoDetailSerializer)
from obrazovanie.utils import VideoSearchFilter
from django_filters.rest_framework import DjangoFilterBackend
from django.contrib.contenttypes.models import ContentType


class VideoList(generics.ListAPIView):
    queryset = Video.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    serializer_class = BaseVideoSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = VideoSearchFilter


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