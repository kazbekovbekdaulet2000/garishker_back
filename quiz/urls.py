from django.urls import path
from quiz.views.test_view import TestDetail


urlpatterns = [
    path('', TestDetail.as_view())
]
