from django.db import models
from config.custom_model import AbstractModel
from django.core.validators import MaxValueValidator, MinValueValidator
import requests
import json
from django.conf import settings


class Payment(AbstractModel):
    order_id = models.CharField(null=False, blank=False, max_length=255)
    amount = models.PositiveIntegerField(default=1000)
    currency = models.CharField(default='KZT', max_length=32)
    capture_method = models.CharField(default="AUTO")
    description = models.CharField(
        default='', null=True, blank=True, max_length=255)
    attempts = models.PositiveBigIntegerField(
        default=10, validators=[MinValueValidator(1), MaxValueValidator(50)])
    card_id = models.CharField(
        default='', null=True, blank=True, max_length=255)

    def __init__(self):
        return self.order_id

    @classmethod
    def createOrder(cls, amount: int, capture_method="AUTO"):
        url = f"{settings.PAYMENT_URL}v2/orders"
        payload = json.dumps({
            "amount": amount,
            "capture_method": capture_method
        })
        headers = {
            'API-KEY': {settings.PAYMENT_API_KEY},
            'Content-Type': 'application/json'
        }
        response = requests.request("POST", url, headers=headers, data=payload)
        print(response.json())
