from rest_framework import generics
from rest_framework import permissions
from course.models.progress.course_user import CourseUser
from course.serializers.course_user_serializer import CourseUserSerializer


class ParticipateCourse(generics.CreateAPIView):
    lookup_field = "id"
    queryset = CourseUser.objects.filter()
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = CourseUserSerializer

    def get_object(self):
        return super().get_object()