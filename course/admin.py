from django.contrib import admin
from course.models.course import Course
from course.models.lector import Lector
from course.models.module import LessonModule
from course.models.lesson import Lesson
from course.models.resource import Resource
from course.models.participant import Participant
from shop.admin import GenericReactionAdmin

admin.site.register([Lesson, Lector, LessonModule, Participant, Resource])
admin.site.register(Course, GenericReactionAdmin)