from django.urls import path
from event.views import EventParticipate, EventSave, EventsDetail, EventsList

urlpatterns = [
    path('', EventsList.as_view()),
    path('<int:id>/', EventsDetail.as_view()),
    path('<int:id>/save/', EventSave.as_view()),
    path('<int:id>/participate/', EventParticipate.as_view())
]
