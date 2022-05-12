from django.contrib import admin
from payment.models.donation import Donation
from payment.models.customer import Customer


admin.site.register(Donation)
admin.site.register(Customer)
