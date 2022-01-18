from rest_framework import generics
from rest_framework import permissions
from rest_framework import status
from obrazovanie.models import Video, VideoComment
from rest_framework.views import APIView
from rest_framework.response import Response
from obrazovanie.serializers.comment_serizializers import VideoCommentCreateSerializer, VideoCommentSerializer
from obrazovanie.serializers.video_serizializers import (
    BaseVideoSerializer, VideoDetailSerializer)
from obrazovanie.utils import VideoSearchFilter
from django_filters.rest_framework import DjangoFilterBackend


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


class VideoCommentList(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get_serializer_class(self):
        if self.request.method == "POST":
            return VideoCommentCreateSerializer
        return VideoCommentSerializer

    def get_queryset(self):
        return VideoComment.objects.filter(video=self.kwargs['id'], reply__isnull=True)


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


class VideoLike(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, *args, **kwargs):
        item = Video.objects.get(id=self.kwargs['id'])
        if(request.user in item.likes.all()):
            item.likes.remove(request.user)
            return Response({"liked": False}, status=status.HTTP_202_ACCEPTED)
        else:
            item.likes.add(request.user)
            return Response({"liked": True}, status=status.HTTP_202_ACCEPTED)


class VideoSave(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, *args, **kwargs):
        item = Video.objects.get(id=self.kwargs['id'])
        if(request.user in item.saves.all()):
            item.saves.remove(request.user)
            return Response(
                {"bookmarked": False}, status=status.HTTP_202_ACCEPTED)
        else:
            item.saves.add(request.user)
            return Response(
                {"bookmarked": True}, status=status.HTTP_202_ACCEPTED)
