from rest_framework import generics
from rest_framework import permissions
from projects.models.project import Project
from projects.serializers.project_serializer import ProjectDetailSerializer, ProjectSerializer


class ProjectList(generics.ListAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    filterset_fields = ('status',)
    # filter_backends = [DjangoFilterBackend, SearchFilter]
    # filterset_class = ReportLanguageFilter


class ProjectDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    queryset = Project.objects.all()
    serializer_class = ProjectDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]