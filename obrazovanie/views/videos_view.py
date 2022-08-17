from rest_framework import generics
from rest_framework import permissions
from obrazovanie.models.video import Video
from rest_framework.response import Response
from obrazovanie.serializers.video_serizializers import (
    BaseVideoSerializer,
    VideoDetailSerializer
)
from obrazovanie.utils import VideoLanguageFilter
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import pagination
from django.db.models import Q
from rest_framework.filters import SearchFilter
from django.utils.decorators import method_decorator
from django.views.decorators.cache import cache_page

class CustomPagination(pagination.PageNumberPagination):
    page_size = 8
    page_size_query_param = 'page_size'
    max_page_size = 50


class RelatedVideoPagination(pagination.PageNumberPagination):
    page_size = 5
    page_size_query_param = 'page_size'
    max_page_size = 50


class VideoList(generics.ListAPIView):
    queryset = Video.objects.all()
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    serializer_class = BaseVideoSerializer
    filter_backends = [DjangoFilterBackend, SearchFilter]
    search_fields = (
        'title_ru', 'title_kk', 'category__name_ru',
        'category__name_kk', 'tags'
    )
    filterset_class = VideoLanguageFilter
    pagination_class = CustomPagination

    @method_decorator(cache_page(60))
    def get(self, request, *args, **kwargs):
        return super().get(request, *args, **kwargs)


class RelatedVideoList(generics.ListAPIView):
    serializer_class = BaseVideoSerializer
    permission_classes = [permissions.AllowAny, ]
    pagination_class = RelatedVideoPagination
    filterset_class = VideoLanguageFilter

    def get_queryset(self):
        pk = self.kwargs['id']
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
    filterset_class = VideoLanguageFilter

    def get_queryset(self):
        return Video.objects.list_bookmarked(self.request.user)


class VideoLiked(generics.ListAPIView):
    serializer_class = BaseVideoSerializer
    permission_classes = [permissions.IsAuthenticated, ]
    filterset_class = VideoLanguageFilter

    def get_queryset(self):
        return Video.objects.list_liked(self.request.user)
