from django.urls import path
from .views.reports_view import (
    ReportLike,
    ReportLiked,
    ReportList,
    ReportDetail,
    ReportBookmarked,
    ReportCommentList,
    ReportSave
)
from .views.categories_view import (
    CategoryList
)

from .views.videos_view import (
    VideoBookmarked,
    VideoCommentList,
    VideoDetail,
    VideoLike,
    VideoLiked,
    VideoList,
    VideoSave
)

urlpatterns = [
    path('categories/', CategoryList.as_view()),

    path('reports/', ReportList.as_view()),
    path('reports/<int:id>/', ReportDetail.as_view()),
    path('reports/<int:id>/comments/', ReportCommentList.as_view()),
    path('reports/<int:id>/like/', ReportLike.as_view()),
    path('reports/<int:id>/save/', ReportSave.as_view()),
    path('reports/bookmarked/', ReportBookmarked.as_view()),
    path('reports/liked/', ReportLiked.as_view()),

    path('videos/', VideoList.as_view()),
    path('videos/<int:id>/', VideoDetail.as_view()),
    path('videos/bookmarked/', VideoBookmarked.as_view()),
    path('videos/liked/', VideoLiked.as_view()),
    path('videos/<int:id>/comments/', VideoCommentList.as_view()),
    path('videos/<int:id>/like/', VideoLike.as_view()),
    path('videos/<int:id>/save/', VideoSave.as_view()),

    # path('search/', SearchView.as_view()),
   
    # path('like/', LikeView.as_view(), name='like_post'),
    # path('/comments/<id>/', CommentDelete.as_view(), name='comment_delete'),
    # path('comments/', CommentList.as_view(), name='comments'), # comment create сюда же на пост поставить
]
