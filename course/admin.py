from django.contrib import admin
from course.models.course import Course
from course.models.lesson import Lesson
from course.models.lector import Lector


admin.site.register([Course, Lesson, Lector])