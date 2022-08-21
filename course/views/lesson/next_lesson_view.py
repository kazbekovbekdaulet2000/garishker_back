from django.shortcuts import get_object_or_404
from rest_framework import permissions
from rest_framework import status
from rest_framework import generics
from rest_framework.response import Response
from course.models.progress.course_user import CourseUser
from course.models.progress.lesson_progress import LessonProgress


class NextLesson(generics.GenericAPIView):
    lookup_field = 'id'
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def post(self, request, *args, **kwargs):
        user_course = self.get_user_course()
        lesson_progress = self.get_lesson_progress(user_course)
        if(user_course.completed):
            return Response({"message": "course completed"}, status=status.HTTP_200_OK)
        if(lesson_progress.quiz == None):
            lesson_progress.completed = True
            lesson_progress.save()
        else:
            return Response({"message": "complete quiz"}, status=status.HTTP_400_BAD_REQUEST)
        return Response({"message": "ok"}, status=status.HTTP_200_OK)

    def get_user_course(self) -> CourseUser:
        filter_kwargs = {
            'course_id': self.kwargs[self.lookup_field],
            'user': self.request.user
        }
        obj = get_object_or_404(CourseUser, **filter_kwargs)
        self.check_object_permissions(self.request, obj)
        return obj

    def get_lesson_progress(self, course: CourseUser) -> LessonProgress:
        return get_object_or_404(course.progress_lessons.all(), lesson=course.current_lesson)
