from rest_framework.views import APIView
from rest_framework.response import Response
from payment.ioka.schema import CreateOrder
from payment.models.donation import UserDonation
from rest_framework import generics
from rest_framework import status
from payment.serializers.donation import DonationCreateSerializer

class CreateDonation(APIView):
    def post(self, request, *args, **kwargs):
        return Response(CreateOrder(amount=1000, back_url=request.build_absolute_uri(), external_id="kit_1").dict())
        # return Response(Donation.createOrder(request.data['amount'], request.build_absolute_uri(), "AUTO"))


class CreateDonationOrder(generics.CreateAPIView):
    queryset = UserDonation.objects.all()
    serializer_class = DonationCreateSerializer