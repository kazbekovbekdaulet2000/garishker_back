from django.forms import ValidationError
from rest_framework import serializers
from payment.models.donation import UserDonation
from django.conf import settings
import json
import requests
import datetime
import pytz


class DonationCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserDonation
        fields = ['amount', 'donation', 'full_name', 'email', 'ioka_answer']
        read_only_fields = ('ioka_answer',)

    def validate(self, attrs):
        time = pytz.UTC.localize(datetime.datetime.now())
        if(attrs['donation'].end_time):
            if(attrs['donation'].end_time >= time):
                raise ValidationError('donation time finished')
        if(attrs['donation'].start_time):
            if(attrs['donation'].start_time <= time):
                raise ValidationError('donation time not started')
        return attrs

    def create(self, validated_data):
        url = f"{settings.PAYMENT_URL}v2/orders"
        validated_data['amount'] = int(validated_data['amount'] * 100)
        payload = json.dumps({
            "amount": validated_data['amount'],
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
