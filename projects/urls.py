from django.urls import path

from projects.views.project_view import ProjectList, ProjectDetail


urlpatterns = [
  path('', ProjectList.as_view()),
  path('<int:id>/', ProjectDetail.as_view())
]
