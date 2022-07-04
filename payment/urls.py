from django.urls import path
from payment.views.donation import CreateDonationOrder
from payment.views.webhook import acme_webhook

urlpatterns = [
    path('donate/', CreateDonationOrder.as_view()),
    path("webhooks/acme/nTOXR11PtCegvXk3bC7z7FUET5EF1WB394JtU38w/", acme_webhook ),
]
