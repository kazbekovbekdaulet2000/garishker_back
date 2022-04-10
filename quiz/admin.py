from django.contrib import admin
from quiz.models.test import Test
from quiz.models.answer import Answer
from quiz.models.question import Question
from quiz.models.attempt import Attempt
from quiz.models.test_result import TestResult


class AnswerInlineModel(admin.TabularInline):
    model = Answer
    fields = ['answer_text', 'is_right', 'order']
    max_num = 5


class QuestionAdmin(admin.ModelAdmin):
    list_display = ['title', 'quiz', 'created_at']
    inlines = [AnswerInlineModel, ]

class ReportAdmin(admin.ModelAdmin):
    def likes_count(self, obj):
        return obj.likes.count()

    list_display = ['title_ru', 'moderated', 'created_at']
    ordering = ['-created_at', '-updated_at']
    exclude = ('likes', 'saves')
    readonly_fields = ('views', 'read_time',)

admin.site.register(Test)
admin.site.register(Question, QuestionAdmin)
admin.site.register(TestResult)
admin.site.register(Attempt)