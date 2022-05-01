from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.request import Request
from payment.models import Donation


class CreateDonation(APIView):
    def post(self, request, *args, **kwargs):
        print(request.path)
        print(request.META)

        # return Response({'hello'})
        return Response(Donation.createOrder(10349832, "AUTO"))
