from django.urls import path
from payment.views import CreateDonation

urlpatterns = [
    path('donation/', CreateDonation.as_view()),
]
