from rest_framework import serializers
from payment.models.donation import UserDonation

class DonationCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserDonation
        fields = "__all__"
