from rest_framework import generics
from rest_framework import permissions
from rest_framework.response import Response
from course.filters import CourseLanguageFilter
from course.models.course.course import Course
from course.models.course.lector import Lector
from course.models.progress.course_user import CourseUser
from course.models.progress.lesson_progress import LessonProgress
from course.permissions import CourseParticipant
from course.serializers.course_serializer import CourseDetailSerializer, CourseSerializer
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter
from course.serializers.lector_serializer import LectorDetailSerializer
from course.serializers.lesson_progress_serializer import LessonProgressSerializer


class CourseList(generics.ListAPIView):
    queryset = Course.objects.filter(to_view=True)
    serializer_class = CourseSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, ]
    filter_backends = [DjangoFilterBackend, SearchFilter]
    search_fields = ('name_kk', 'name_ru', 'description_kk', 'description_ru')
    filterset_class = CourseLanguageFilter


class CourseParticipantList(generics.ListAPIView):
    queryset = Course.objects.filter(to_view=True)
    serializer_class = CourseSerializer
    permission_classes = [permissions.IsAuthenticated, ]
    filter_backends = [DjangoFilterBackend, SearchFilter]
    search_fields = ('name_kk', 'name_ru', 'description_kk', 'description_ru')
    filterset_class = CourseLanguageFilter

    def get_queryset(self):
        ids = CourseUser.objects.filter(user=self.request.user).values_list('course', flat=True)
        return Course.objects.filter(to_view=True, id__in=ids)


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


class CourseLectorList(generics.ListAPIView):
    serializer_class = LectorDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    pagination_class = None
    
    def get_queryset(self):
        return Lector.objects.filter(lessons__course_id=self.kwargs['id']).distinct()


class CourseResultsDetail(generics.ListAPIView):
    queryset = LessonProgress.objects.filter()
    serializer_class = LessonProgressSerializer
    pagination_class = None
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, CourseParticipant]
