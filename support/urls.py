from django.urls import path
from support.views import ContactListView, QuestionListView, EmailRequestView


urlpatterns = [
    path('', ContactListView.as_view(), name='create_support'),
    path('email/', EmailRequestView.as_view()),
    path('questions/', QuestionListView.as_view(), name='questions_urls')
]
