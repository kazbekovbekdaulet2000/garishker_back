from django.urls import path
from .views import *

urlpatterns = [
    path('contact_us', ContactUs.as_view(), name='contact_us_urls'),
    path('questions', QuestionView.as_view(), name='questions_urls'),

]
