from pydantic import conset
from rest_framework import serializers
from payment.models.donation import UserDonation
from django.conf import settings
import json
import requests


class DonationCreateSerializer(serializers.ModelSerializer):

    class Meta:
        model = UserDonation
        fields = ['amount', 'donation', 'full_name', 'email', 'ioka_answer']
        read_only_fields = ('ioka_answer',)

    def create(self, validated_data):
        url = f"{settings.PAYMENT_URL}v2/orders"
        print(validated_data['donation'].key)
        payload = json.dumps({
            "amount": int(validated_data['amount'] * 100),
            "extra_info": {
                "project": validated_data['donation'].key
            }
        })
        headers = {
            'API-KEY': settings.PAYMENT_API_KEY,
            'Content-Type': 'application/json'
        }
        response = requests.request("POST", url, headers=headers, data=payload)
        validated_data['order_id'] = response.json()['order']['id']
        validated_data['ioka_answer'] = response.json()
        return super().create(validated_data)
