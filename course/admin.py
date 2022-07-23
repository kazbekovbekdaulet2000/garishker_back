from django.contrib import admin
from course.models.course.course import Course
from course.models.course.lector import Lector
from course.models.course.module import LessonModule
from course.models.course.lesson import Lesson
from course.models.progress.course_user import CourseUser
from course.models.progress.lesson_progress import LessonProgress
from course.models.progress.question_progress import QuizQuestionProgress
from course.models.progress.quiz_progress import QuizProgress
from course.models.quiz.answer import Answer
from course.models.quiz.question import Question
from course.models.quiz.quiz import Quiz
from course.models.course.resource import Resource
from shop.admin import GenericReactionAdmin

class CourseAdmin(GenericReactionAdmin):
    readonly_fields = GenericReactionAdmin.readonly_fields + ('views', 'lesson_count')

admin.site.register(Course, CourseAdmin)
admin.site.register(Lesson, GenericReactionAdmin)
admin.site.register(LessonModule, GenericReactionAdmin)
admin.site.register([Lector, Resource])


class CourseUserAdmin(admin.ModelAdmin):
    readonly_fields = ('user', 'course')
    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        form.base_fields['current_lesson'].queryset = Lesson.objects.filter(course=obj.course)
        return form


class LessonProgressAdmin(admin.ModelAdmin):
    readonly_fields = ('user', )
    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        form.base_fields['lesson'].queryset = Lesson.objects.filter(course=obj.user.course)
        return form


admin.site.register(CourseUser, CourseUserAdmin)
admin.site.register(LessonProgress, LessonProgressAdmin)
admin.site.register([QuizProgress, QuizQuestionProgress])


class AnswerInlineModel(admin.TabularInline):
    model = Answer
    fields = ['answer_ru', 'answer_kk', 'correct']
    max_num = 5
    extra = 0


class QuestionAdmin(admin.ModelAdmin):
    list_display = ['question_ru', 'question_kk', 'quiz', 'created_at']
    inlines = [AnswerInlineModel, ]


admin.site.register(Quiz)
admin.site.register(Question, QuestionAdmin)