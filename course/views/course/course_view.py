from rest_framework import generics
from rest_framework import permissions
from rest_framework.response import Response
from course.filters import CourseLanguageFilter
from course.models.course.course import Course
from course.serializers.course_serializer import CourseDetailSerializer, CourseSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter


class CourseList(generics.ListAPIView):
    queryset = Course.objects.filter(to_view=True)
    serializer_class = CourseSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    filter_backends = [DjangoFilterBackend, SearchFilter]
    search_fields = ('name_kk', 'name_ru', 'description_kk', 'description_ru')
    filterset_class = CourseLanguageFilter


class CourseDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    queryset = Course.objects.filter(to_view=True)
    serializer_class = CourseDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.increase_views()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)
