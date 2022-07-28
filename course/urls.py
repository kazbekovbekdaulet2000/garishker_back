from django.urls import path
from course.models.course.course import Course
from course.views.course.course_participate_view import ParticipateCourse
from course.views.course.course_view import CourseDetail, CourseLectorList, CourseList
from course.views.lesson.current_lesson_view import CurrentLessonDetail
from course.views.lesson.lesson_resource_view import LessonResourceList
from course.views.lesson.lessons_view import LessonDetail, LessonList
from course.views.lesson.next_lesson_view import NextLesson
from course.views.quiz.quiz_attempts_view import LessonQuizAttemptList
from course.views.quiz.quiz_finish_view import LessonQuizFinish
from course.views.quiz.quiz_question_answers_view import LessonQuizQuestionAnswers
from course.views.quiz.quiz_questions_view import LessonQuizQuestionDetail, LessonQuizQuestionList
from course.views.quiz.quiz_start_view import LessonQuizStart
from course.views.quiz.quiz_view import LessonQuiz
from reaction.models.review import Review
from reaction.views.bookmark_view import BookmarkAction
from reaction.views.like_view import LikeAction
from reaction.views.review_view import ReviewDetail, ReviewList

urlpatterns = [
    # ----------- Course Info ----------- #
    path('', CourseList.as_view()),
    path('<int:id>/', CourseDetail.as_view()),
    path('<int:id>/lectors/', CourseLectorList.as_view()),
    path('<int:id>/participate/', ParticipateCourse.as_view()),

    # ----------- Lessons ----------- #
    path('<int:id>/lessons/', LessonList.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/', LessonDetail.as_view()),
    path('<int:id>/lessons/current/', CurrentLessonDetail.as_view()),
    path('<int:id>/lessons/next_lesson/', NextLesson.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/resources/', LessonResourceList.as_view()),

    # ----------- Quiz ----------- #
    path('<int:id>/lessons/<int:lesson_id>/quiz/', LessonQuiz.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/quiz/start/', LessonQuizStart.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/quiz/finish/', LessonQuizFinish.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/quiz/attempts/', LessonQuizAttemptList.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/quiz/questions/', LessonQuizQuestionList.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/quiz/questions/<int:question_id>/', LessonQuizQuestionDetail.as_view()),
    path('<int:id>/lessons/<int:lesson_id>/quiz/questions/<int:question_id>/answer/', LessonQuizQuestionAnswers.as_view()),

    # ----------- Rating ----------- #
    path('<int:id>/ratings/', ReviewList.as_view(model=Course)),
    path('<int:id>/ratings/<int:review_id>/', ReviewDetail.as_view(model=Course)),
    path('<int:id>/ratings/<int:review_id>/like/', LikeAction.as_view(model=Review, lookup_field='review_id')),
    path('<int:id>/ratings/<int:review_id>/save/', BookmarkAction.as_view(model=Review, lookup_field='review_id')),
]
