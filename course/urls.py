from course.models.course import Course
from course.views.course_view import (
    CourseList,
    CourseDetail,
)
from django.urls import path
from course.views.lessons_view import LessonCurrent, LessonDetail, LessonList, LessonNext
from course.views.participation_view import CourseParticipation, UserParticipationList
from course.views.resource_view import ResourceList

from reaction.models.review import Review
from reaction.views.bookmark_view import BookmarkAction
from reaction.views.like_view import LikeAction
from reaction.views.review_view import ReviewDetail, ReviewList

urlpatterns = [
    # ----------- Course Info ----------- #
    path('', CourseList.as_view()),
    path('my/', UserParticipationList.as_view(model=Course)),
    path('<int:id>/', CourseDetail.as_view()),
    path('<int:id>/participate/',
         CourseParticipation.as_view(lookup_url_kwarg='id', model=Course)),

    # ----------- Lessons ----------- #
    path('<int:id>/lessons/', LessonList.as_view()),
    path('<int:id>/lessons/current/', LessonCurrent.as_view()),
    path('<int:id>/lessons/next/', LessonNext.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/', LessonDetail.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/resources/', ResourceList.as_view()),
    # path('<int:id>/lessons/<int:lesson_id>/participate/', CourseParticipation.as_view(lookup_url_kwarg='lesson_id', model=Lesson)),

    # ----------- Rating ----------- #
    path('<int:id>/ratings/', ReviewList.as_view(model=Course)),
    path('<int:id>/ratings/<int:review_id>/',
         ReviewDetail.as_view(model=Course)),
    path('<int:id>/ratings/<int:review_id>/like/',
         LikeAction.as_view(model=Review, lookup_field='review_id')),
    path('<int:id>/ratings/<int:review_id>/save/',
         BookmarkAction.as_view(model=Review, lookup_field='review_id')),
]
