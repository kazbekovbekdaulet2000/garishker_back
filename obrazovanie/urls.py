from django.urls import path
from obrazovanie.models.report import Report
from obrazovanie.models.video import Video
from reaction.models.comment import Comment
from reaction.views.bookmark_view import BookmarkAction
from reaction.views.comment_view import CommentDetail, CommentList
from reaction.views.like_view import LikeAction
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

    path('reports/<int:id>/like/', LikeAction.as_view(model=Report, lookup_field='id')),
    path('reports/<int:id>/save/', BookmarkAction.as_view(model=Report, lookup_field='id')),

    path('reports/<int:id>/comments/', CommentList.as_view(model=Report)),
    path('reports/<int:id>/comments/<int:comment_id>/', CommentDetail.as_view(model=Report)),
    path('reports/<int:id>/comments/<int:comment_id>/like/', LikeAction.as_view(model=Comment, lookup_field='comment_id')),
    path('reports/<int:id>/comments/<int:comment_id>/save/', BookmarkAction.as_view(model=Comment, lookup_field='comment_id')),

    # --------------------------------------------- #
    # Videos #
    path('videos/', VideoList.as_view()),
    path('videos/<int:id>/', VideoDetail.as_view()),
    path('videos/<int:id>/related/', RelatedVideoList.as_view()),

    path('videos/bookmarked/', VideoBookmarked.as_view()),
    path('videos/liked/', VideoLiked.as_view()),

    path('videos/<int:id>/like/', LikeAction.as_view(model=Video, lookup_field='id')),
    path('videos/<int:id>/save/', BookmarkAction.as_view(model=Video, lookup_field='id')),

    path('videos/<int:id>/comments/', CommentList.as_view(model=Video)),
    path('videos/<int:id>/comments/<int:comment_id>/', CommentDetail.as_view(model=Video)),
    path('videos/<int:id>/comments/<int:comment_id>/like/', LikeAction.as_view(model=Comment, lookup_field='comment_id')),
    path('videos/<int:id>/comments/<int:comment_id>/save/', BookmarkAction.as_view(model=Comment, lookup_field='comment_id')),
]
