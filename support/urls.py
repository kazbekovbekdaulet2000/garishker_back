from django.urls import path
from .views import *

urlpatterns = [
    path('contact_us', ContactUss.as_view(), name='contact_us_urls'),
    path('questions', QuestionView.as_view(), name='questions_urls'),
    path('create_support', CreateContactUs.as_view(), name='create_support')

]
