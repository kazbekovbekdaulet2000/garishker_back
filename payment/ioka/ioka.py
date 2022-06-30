from json.decoder import JSONDecodeError
from ioka import schemas
from django.conf import settings

from payment.ioka.schema import CreateOrder

class IOKA:

    def __init__(self, secret_key: str, host: str):
        self.secret_key = secret_key
        self.host = host

    @property
    def _headers(self):
        return {
            'Content-Type': 'application/json',
            'API-KEY': settings.PAYMENT_API_KEY
        }
    
    def create_order(self, order: CreateOrder):
        print(order)
        pass