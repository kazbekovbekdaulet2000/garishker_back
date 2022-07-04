import email
from django.db import models
from common.custom_model import AbstractModel
from payment.models.donation_project import Donation
from django.utils.translation import gettext_lazy as _


class UserDonation(AbstractModel):
    order_id = models.CharField(max_length=255)
    amount = models.IntegerField(default=100)
    donation = models.ForeignKey(Donation, on_delete=models.DO_NOTHING, related_name="donat", null=True, blank=True)
    full_name = models.CharField(max_length=255, null=True)
    email = models.EmailField(max_length=255, null=True)

    def __str__(self):
        return f"{self.full_name} {self.amount}"
        
    class Meta:
        verbose_name = 'Донат'
        verbose_name_plural = 'Донаты'
