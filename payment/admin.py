from django.contrib import admin
from payment.models.donation_project import Donation
from payment.models.donation import UserDonation
from payment.models.payment import Payment
from payment.models.webhook_event import WebhookEvent


admin.site.register(Donation)
admin.site.register(Payment)
admin.site.register(UserDonation)
admin.site.register(WebhookEvent)
