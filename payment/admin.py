from django.contrib import admin
from payment.models.donation_project import Donation
from payment.models.donation import UserDonation
from payment.models.payment import Payment


admin.site.register(Donation)
admin.site.register(Payment)
admin.site.register(UserDonation)
