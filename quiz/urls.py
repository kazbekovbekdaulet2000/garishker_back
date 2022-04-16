from django.urls import path
from quiz.views.question_view import TestQuestion, TestQuestionList
from quiz.views.test_new_attempt_view import TestNewAttemp
from quiz.views.test_result_view import TestResultCreate
from quiz.views.test_view import TestDetail, TestResultDetail


urlpatterns = [
    path('<int:test_id>/', TestDetail.as_view()),
    path('<int:test_id>/result/', TestResultDetail.as_view()),
    path('<int:test_id>/finish/', TestResultCreate.as_view()),
    path('<int:test_id>/reset/', TestNewAttemp.as_view()),
    path('<int:test_id>/questions/', TestQuestionList.as_view()),
    path('<int:test_id>/questions/<int:question_id>/', TestQuestion.as_view()),
]
