from django.urls import path
from .views import *

urlpatterns = [
    path('categories', CategoryView.as_view(), name='category_urls'),
    path('category', DataByCategoryView.as_view(), name='category_detail_urls'),
    path('sections', SectionView.as_view(), name='section_urls'),
    path('reports', ReportView.as_view(), name='report_urls'),
    path('videos', VideoView.as_view(), name='video_urls'),
]
