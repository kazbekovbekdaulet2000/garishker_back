from django.shortcuts import get_object_or_404
from rest_framework import generics
from rest_framework import permissions
from course.models.course.lesson import Lesson
from course.serializers.quiz_serializer import QuizSerializer
from django.http import Http404


class LessonQuizNewAttemp(generics.CreateAPIView):
    pass