from rest_framework.views import APIView
from rest_framework.response import Response
from payment.ioka.schema import CreateOrder
from payment.models.donation_project import Donation
from rest_framework import generics

class CreateDonation(APIView):
    def post(self, request, *args, **kwargs):
        return Response(CreateOrder(amount=1000, back_url=request.build_absolute_uri(), external_id="kit_1").dict())
        # return Response(Donation.createOrder(request.data['amount'], request.build_absolute_uri(), "AUTO"))


class CreateOrder(generics.CreateAPIView):
    pass
    # queryset = Project.objects.all()
    # serializer_class = ProjectSerializer
    # permission_classes = [permissions.IsAuthenticatedOrReadOnly,]