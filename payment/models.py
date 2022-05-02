from django.db import models
from config.custom_model import AbstractModel
from django.core.validators import MaxValueValidator, MinValueValidator
import requests
import json
from django.conf import settings

class Customer(AbstractModel):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='card', on_delete=models.CASCADE, null=False)
    customer_id = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    phone = models.CharField(max_length=255)

    @classmethod
    def createCustomer(cls, amount: int, capture_method="AUTO"):
        url = f"{settings.PAYMENT_URL}v2/orders"
        payload = json.dumps({
            "amount": amount,
            "capture_method": capture_method,
            "back_url": "https://garyshker-dev.web.app/"
        })
        headers = {
            'API-KEY': settings.PAYMENT_API_KEY,
            'Content-Type': 'application/json'
        }
        response = requests.request("POST", url, headers=headers, data=payload)
        return response.json()

class Donation(AbstractModel):
    order_id = models.CharField(null=False, blank=False, max_length=255)
    shop_id = models.CharField(null=False, blank=False, max_length=255)
    status = models.CharField(null=False, blank=False, max_length=255)
    amount = models.PositiveIntegerField(default=1000)
    currency = models.CharField(default='KZT', max_length=32)
    capture_method = models.CharField(default="AUTO", max_length=12)
    description = models.CharField(
        default='', null=True, blank=True, max_length=255)
    attempts = models.PositiveBigIntegerField(
        default=10, validators=[MinValueValidator(1), MaxValueValidator(50)])
    card_id = models.CharField(
        default='', null=True, blank=True, max_length=255)

    def __init__(self):
        return self.order_id

    @classmethod
    def createOrder(cls, amount: int, back_url="https://garyshker-dev.web.app/", capture_method="AUTO"):
        url = f"{settings.PAYMENT_URL}v2/orders"
        payload = json.dumps({
            "amount": amount,
            "capture_method": capture_method,
            "back_url": back_url
        })
        headers = {
            'API-KEY': settings.PAYMENT_API_KEY,
            'Content-Type': 'application/json'
        }
        response = requests.request("POST", url, headers=headers, data=payload)
        return response.json()

    class Meta:
        verbose_name = 'Донат'
        verbose_name_plural = 'Донаты'

	
# {
#   "order": {
#     "id": "ord_aypk2FSAdR",
#     "shop_id": "shp_SNL708X0PI",
#     "status": "UNPAID",
#     "created_at": "2022-05-01T23:47:57.394206",
#     "amount": 10349832,
#     "currency": "KZT",
#     "mcc": null,
#     "capture_method": "AUTO",
#     "external_id": null,
#     "description": null,
#     "extra_info": null,
#     "attempts": 10,
#     "due_date": null,
#     "customer_id": null,
#     "card_id": null,
#     "back_url": "https://garyshker-dev.web.app/",
#     "success_url": null,
#     "failure_url": null,
#     "template": null,
#     "access_token": "ord_aypk2FSAdR_secret_498308e0fc57ca05dbf47fb15081785f25b007f30a3324bee238d17b78956c22",
#     "checkout_url": "https://stage-checkout.ioka.kz/orders/ord_aypk2FSAdR",
#     "payments": []
#   },
#   "order_access_token": "ord_aypk2FSAdR_secret_498308e0fc57ca05dbf47fb15081785f25b007f30a3324bee238d17b78956c22"
# }