from rest_framework.views import APIView
from rest_framework.response import Response
from payment.models import Donation


class CreateDonation(APIView):
    def post(self, request, *args, **kwargs):
        return Response(Donation.createOrder(request.data['amount'], "https://garyshker-dev.web.app/", "AUTO"))
