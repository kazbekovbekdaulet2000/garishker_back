from django.urls import path
from payment.views import CreateDonation

urlpatterns = [
    path('donate/', CreateDonation.as_view()),
]
