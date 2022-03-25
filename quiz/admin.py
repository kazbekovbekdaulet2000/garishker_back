from django.contrib import admin
from quiz.models.test import Test
from quiz.models.answer import Answer
from quiz.models.question import Question


class AnswerInlineModel(admin.TabularInline):
    model = Answer
    fields = ['answer_text', 'is_right']
    max_num = 5


class QuestionAdmin(admin.ModelAdmin):
    list_display = ['title', 'quiz', 'created_at']
    inlines = [AnswerInlineModel, ]


admin.site.register(Test)
admin.site.register(Question, QuestionAdmin)
