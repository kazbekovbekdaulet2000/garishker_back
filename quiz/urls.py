from django.urls import path
from quiz.views.question_view import TestQuestion
from quiz.views.test_result_view import TestResultCreate
from quiz.views.test_view import TestDetail, TestResultDetail


urlpatterns = [
    path('<int:test_id>/', TestDetail.as_view()),
    path('<int:test_id>/result/', TestResultDetail.as_view()),
    path('<int:test_id>/finish/', TestResultCreate.as_view()),
    # path('<int:test_id>/new_attempt/', TestNewAttempDetail.as_view()),
    path('<int:test_id>/questions/<int:question_id>/', TestQuestion.as_view()),
]
