from django.urls import path
from event.models.event import Event
from event.views.event_views import EventParticipate, EventsDetail, EventsDetailSlug, EventsList
from reaction.models.comment import Comment
from reaction.views.bookmark_view import BookmarkAction
from reaction.views.comment_view import CommentDetail, CommentList
from reaction.views.like_view import LikeAction


urlpatterns = [
    path('', EventsList.as_view()),
    path('<int:id>/', EventsDetail.as_view()),
    path('<slug:slug>/', EventsDetailSlug.as_view()),
    path('<int:id>/participate/', EventParticipate.as_view()),

    path('<int:id>/like/', LikeAction.as_view(model=Event, lookup_field='id')),
    path('<int:id>/save/', BookmarkAction.as_view(model=Event, lookup_field='id')),

    path('<int:id>/comments/', CommentList.as_view(model=Event)),
    path('<int:id>/comments/<int:comment_id>/', CommentDetail.as_view(model=Event)),
    path('<int:id>/comments/<int:comment_id>/like/', LikeAction.as_view(model=Comment, lookup_field='comment_id')),
    path('<int:id>/comments/<int:comment_id>/save/', BookmarkAction.as_view(model=Comment, lookup_field='comment_id')),
]
