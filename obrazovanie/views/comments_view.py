from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from obrazovanie.models.comment import Comment
from obrazovanie.permissions import IsCommentOwnerOrAdmin

from obrazovanie.serializers.comment_serizializers import CommentCreateSerializer, CommentSerializer
from django.contrib.contenttypes.models import ContentType


class CommentList(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    model = None

    def get_serializer_class(self):
        if self.request.method == "POST":
            return CommentCreateSerializer
        return CommentSerializer

    def get_queryset(self):
        if not self.request:
            return Comment.objects.none()
        return Comment.objects.filter(
            content_type=ContentType.objects.get_for_model(self.model),
            object_id=self.kwargs.get('id'),
            reply__isnull=True
        ).order_by('-created_at')

    def get_serializer_context(self):
        if self.request.method == "POST":
            return {
                'request': self.request,
                'format': self.format_kwarg,
                'view': self,
                'model': self.model,
                'object_id': self.kwargs.get('id')
            }
        return super().get_serializer_context()


class CommentDetail(generics.RetrieveUpdateDestroyAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'comment_id'
    permission_classes = [IsCommentOwnerOrAdmin]
    serializer_class = CommentCreateSerializer
    model = None

    def get_serializer_class(self):
        edit_methods = ("POST", "PUT", "PATCH", "DELETE")
        if self.request.method in edit_methods:
            return CommentCreateSerializer
        return CommentSerializer

    def get_queryset(self):
        if not self.request:
            return Comment.objects.none()
        return Comment.objects.filter(
            content_type=ContentType.objects.get_for_model(self.model),
            object_id=self.kwargs.get('id'),
        )

    def get_serializer_context(self):
        if self.request.method == "POST":
            return {
                'request': self.request,
                'format': self.format_kwarg,
                'view': self,
                'model': self.model,
                'object_id': self.kwargs.get('id')
            }
        return super().get_serializer_context()


class CommentLike(APIView):
    permission_classes = [permissions.IsAuthenticated]
    model = None

    def post(self, request, *args, **kwargs):
        item = Comment.objects.get(id=self.kwargs['comment_id'])
        if(request.user in item.likes.all()):
            item.likes.remove(request.user)
            return Response({"liked": False}, status=status.HTTP_202_ACCEPTED)
        else:
            item.likes.add(request.user)
            return Response({"liked": True}, status=status.HTTP_202_ACCEPTED)
