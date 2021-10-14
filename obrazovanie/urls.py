from django.urls import path
from .views import *

urlpatterns = [
    path('categories', CategoryView.as_view(), name='category_urls'),
    path('category', DataByCategoryView.as_view(), name='category_detail_urls'),
    path('sections', SectionView.as_view(), name='section_urls'),
    path('reports', ReportView.as_view(), name='report_urls'),
    path('report_create', ReportCreate.as_view(), name='report_create_urls'),
    path('report_detail/<int:pk>', ReportDetail.as_view(), name='report_detail_urls'),
    path('videos', VideoView.as_view(), name='video_urls'),
    path('search_data', SearchView.as_view(), name='search_urls'),
    path('report_favourites', ReportFavourites.as_view(), name='report_favourites_urls'),
    path('list_of_favourites', ListOfFavourites.as_view(), name='list_of_favourites_urls'),
]
