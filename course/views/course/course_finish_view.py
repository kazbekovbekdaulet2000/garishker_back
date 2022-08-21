from re import A
from rest_framework import generics, permissions, status
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from course.models.progress.course_user import CourseUser


class FinishCourse(generics.GenericAPIView):
    lookup_field = "course__id"
    lookup_url_kwarg = 'id'
    queryset = CourseUser.objects.filter(completed=False)
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = None

    def get_object(self):
        queryset = self.filter_queryset(self.get_queryset())
        filter_kwargs = {self.lookup_field: self.kwargs[self.lookup_url_kwarg]}
        obj = get_object_or_404(queryset, **filter_kwargs)

        self.check_object_permissions(self.request, obj)

        return obj

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

    def create(self, request, *args, **kwargs):
        course = self.get_object()
        lessons = course.progress_lessons.all()
        completed = lessons.values_list('completed', flat=True)
        if(False in list(completed)):
            return Response(None, status=status.HTTP_406_NOT_ACCEPTABLE)

        lessons = lessons.filter(quiz__isnull=False)
        points = 0
        
        for lesson in lessons:
            attempts = lesson.quiz_attempts.filter(completed=True)
            point=0
            for attempt in attempts:
                attempt_point = attempt.progress
                if(point < attempt_point):
                    point = attempt_point
            points += point
        
        # course = points//len(lessons)

        return Response({points: points//len(lessons)}, status=status.HTTP_202_ACCEPTED)
