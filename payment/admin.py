from django.contrib import admin
from payment.models.donation import Donation
from payment.models.customer import Customer
# from payment.models.order import DonationOrder


admin.site.register(Donation)
# admin.site.register(DonationOrder)
admin.site.register(Customer)
