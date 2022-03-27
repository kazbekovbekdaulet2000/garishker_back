from course.models.course import Course
from course.models.lesson import Lesson
from course.views.course_view import (
    CourseList,
    CourseDetail,
)
from django.urls import include, path
from course.views.lessons_view import LessonDetail, LessonList
from course.views.participation_view import CourseParticipation, UserParticipationList
from course.views.resource_view import ResourceList

from rating.views import RatingDetail, RatingLike, RatingList

urlpatterns = [
    # ----------- Course Info ----------- #
    path('', CourseList.as_view()),
    path('my/', UserParticipationList.as_view(model=Course)),
    path('<int:id>/', CourseDetail.as_view()),
    path('<int:id>/participate/',
         CourseParticipation.as_view(lookup_url_kwarg='id', model=Course)),

    # ----------- Lessons ----------- #
    path('<int:id>/lessons/', LessonList.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/', LessonDetail.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/resources/', ResourceList.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/participate/', CourseParticipation.as_view(lookup_url_kwarg='lesson_id', model=Lesson)),

    # ----------- Rating ----------- #
    path('<int:id>/ratings/', RatingList.as_view(model=Course)),
    path('<int:id>/ratings/<int:rating_id>/',
         RatingDetail.as_view(model=Course)),
    path('<int:id>/ratings/<int:rating_id>/like/',
         RatingLike.as_view(model=Course)),


]
