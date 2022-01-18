from django.urls import path

from support.views import ContactListView, QuestionListView

urlpatterns = [
    path('questions', QuestionListView.as_view(), name='questions_urls'),
    path('', ContactListView.as_view(), name='create_support')
]
