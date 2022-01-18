from django.urls import path

from dobro.views import ProjectList, ProjectDetail

urlpatterns = [
    path('projects/', ProjectList.as_view(), name='projects_urls'),
    path('projects/<int:id>/', ProjectDetail.as_view(), name='project_detail_urls'),
]
