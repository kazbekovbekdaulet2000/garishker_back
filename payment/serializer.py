from rest_framework import serializers
from payment.models import Donation


class DonationCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Donation
        fields = "__all__"
