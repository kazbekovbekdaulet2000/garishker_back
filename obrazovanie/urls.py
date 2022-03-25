from django.urls import path
from obrazovanie.models.report import Report
from obrazovanie.models.video import Video

from obrazovanie.views.comments_view import CommentDetail, CommentLike, CommentList
from obrazovanie.views.likes_saves_view import Like, Save
from .views.reports_view import (
    RelatedReportList,
    ReportLiked,
    ReportList,
    ReportDetail,
    ReportBookmarked,
)
from .views.categories_view import (
    CategoryList
)

from .views.videos_view import (
    RelatedVideoList,
    VideoBookmarked,
    VideoDetail,
    VideoLiked,
    VideoList,
)

urlpatterns = [
    path('categories/', CategoryList.as_view()),

    # --------------------------------------------- #
    # Reports #
    path('reports/', ReportList.as_view()),
    path('reports/<int:id>/', ReportDetail.as_view()),
    path('reports/<int:id>/related/', RelatedReportList.as_view()),
    
    path('reports/bookmarked/', ReportBookmarked.as_view()),
    path('reports/liked/', ReportLiked.as_view()),
    
    path('reports/<int:id>/comments/', CommentList.as_view(model=Report)),
    path('reports/<int:id>/comments/<int:comment_id>/', CommentDetail.as_view(model=Report)),
    path('reports/<int:id>/comments/<int:comment_id>/like/', CommentLike.as_view(model=Report)),
    
    path('reports/<int:id>/like/', Like.as_view(model=Report)),
    path('reports/<int:id>/save/', Save.as_view(model=Report)),
   
    # --------------------------------------------- #
    # Videos #
    path('videos/', VideoList.as_view()),
    path('videos/<int:id>/', VideoDetail.as_view()),
    path('videos/<int:id>/related/', RelatedVideoList.as_view()),
    
    path('videos/bookmarked/', VideoBookmarked.as_view()),
    path('videos/liked/', VideoLiked.as_view()),
    
    path('videos/<int:id>/comments/', CommentList.as_view(model=Video)),
    path('videos/<int:id>/comments/<int:comment_id>/', CommentDetail.as_view(model=Video)),
    path('videos/<int:id>/comments/<int:comment_id>/like/', CommentLike.as_view(model=Video)),

    path('videos/<int:id>/like/', Like.as_view(model=Video)),
    path('videos/<int:id>/save/', Save.as_view(model=Video)),
]
