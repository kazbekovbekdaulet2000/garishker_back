from django.urls import path
from .views import *

urlpatterns = [
    path('projects', Projects.as_view(), name='projects_urls'),
    path('project_detail/<int:id>', ProjectDetail.as_view(), name='project_detail_urls'),
]
