from django.urls import path
from quiz.views.answer_view import TestQuestionAnswerDetail
from quiz.views.question_view import TestQuestion
from quiz.views.test_view import TestDetail


urlpatterns = [
    path('', TestDetail.as_view()),
    path('<int:question_id>/', TestQuestion.as_view()),
    path('<int:question_id>/answers/<int:answer_id>/', TestQuestionAnswerDetail.as_view())
]
