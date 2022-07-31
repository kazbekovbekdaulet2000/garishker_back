from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from rest_framework.response import Response
from course.models.course.course import Course
from course.models.progress.course_user import CourseUser
from course.serializers.lesson_serializer import LessonDetailSerializer


class CurrentLessonDetail(generics.RetrieveAPIView):
    lookup_field = 'id'
    serializer_class = LessonDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
    user_course = None
    
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.increase_views()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)
    
    def get_queryset(self):
        user = self.request.user
        if(not user.is_anonymous):
            course = get_object_or_404(Course, id=self.kwargs['id'])
            self.user_course = CourseUser.objects.filter(user=user, course=course).first()
        return CourseUser.objects.filter()

    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        filter_kwargs = {
            'course_id': self.kwargs[self.lookup_field],
            'user': self.request.user
        }
        obj = get_object_or_404(queryset, **filter_kwargs)
        obj = obj.current_lesson
        self.check_object_permissions(self.request, obj)
        return obj
