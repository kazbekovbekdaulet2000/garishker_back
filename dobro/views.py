from rest_framework import generics
from rest_framework import permissions

from dobro.models import Dobro
from dobro.serializers import DobroDetailSerializer, DobroSerializer

class ProjectList(generics.ListAPIView):
    queryset = Dobro.objects.all()
    serializer_class = DobroSerializer
    permission_classes = [permissions.AllowAny,]
    pagination_class = None


class ProjectDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    permission_classes = [permissions.AllowAny, ]
    queryset = Dobro.objects.all()
    serializer_class = DobroDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
