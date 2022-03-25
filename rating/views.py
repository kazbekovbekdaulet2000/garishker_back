from rest_framework import generics
from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from django.contrib.contenttypes.models import ContentType
from rating.models import Rating
from rating.permissions import IsRatingOwnerOrAdmin

from rating.serializers import RatingCreateSerializer, RatingSerializer


class RatingList(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    model = None

    def get_serializer_class(self):
        if self.request.method == "POST":
            return RatingCreateSerializer
        return RatingSerializer

    def get_queryset(self):
        if not self.request:
            return Rating.objects.none()
        return Rating.objects.filter(
            content_type=ContentType.objects.get_for_model(self.model),
            object_id=self.kwargs.get('id')
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


class RatingDetail(generics.RetrieveUpdateDestroyAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'rating_id'
    permission_classes = [IsRatingOwnerOrAdmin]
    serializer_class = RatingCreateSerializer
    model = None

    def get_serializer_class(self):
        edit_methods = ("POST", "PUT", "PATCH", "DELETE")
        if self.request.method in edit_methods:
            return RatingCreateSerializer
        return RatingSerializer

    def get_queryset(self):
        if not self.request:
            return Rating.objects.none()
        return Rating.objects.filter(
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


class RatingLike(APIView):
    permission_classes = [permissions.IsAuthenticated]
    model = None

    def post(self, request, *args, **kwargs):
        item = Rating.objects.get(id=self.kwargs['rating_id'])
        if(request.user in item.likes.all()):
            item.likes.remove(request.user)
            return Response({"liked": False}, status=status.HTTP_202_ACCEPTED)
        else:
            item.likes.add(request.user)
            return Response({"liked": True}, status=status.HTTP_202_ACCEPTED)
