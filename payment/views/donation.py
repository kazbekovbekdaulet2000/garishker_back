from payment.models.donation import UserDonation
from rest_framework import generics
from payment.serializers.donation import DonationCreateSerializer


class CreateDonationOrder(generics.CreateAPIView):
    queryset = UserDonation.objects.all()
    serializer_class = DonationCreateSerializer