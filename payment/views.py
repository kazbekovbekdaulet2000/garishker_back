from rest_framework.views import APIView
from rest_framework.response import Response
from payment.models.donation import Donation


class CreateDonation(APIView):
    def post(self, request, *args, **kwargs):
        return Response(Donation.createOrder(request.data['amount'], request.build_absolute_uri(), "AUTO"))
