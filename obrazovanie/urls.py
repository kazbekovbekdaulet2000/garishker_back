from django.urls import path
from .views import *

urlpatterns = [
    path('categories', CategoryView.as_view(), name='category_urls'),
    path('category', DataByCategoryView.as_view(), name='category_detail_urls'),
    path('sections', SectionView.as_view(), name='section_urls'),
    path('reports', ReportView.as_view(), name='report_urls'),
    path('videos', VideoView.as_view(), name='video_urls'),
    path('search_data', SearchView.as_view(), name='search_urls'),
    path('like/', LikeView.as_view(), name='like_post'),
    path('unlike/', UnlikeView.as_view(), name='unlike_post'),
    path('comment/', CommentCreate.as_view(), name='comment_create'),
    path('delete/', CommentDelete.as_view(), name='comment_delete'),
    path('comments/', CommentList.as_view(), name='comments'),

]
