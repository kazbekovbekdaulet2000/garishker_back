from django.shortcuts import render
from rest_framework.views import *
from .serializers import *
from rest_framework.response import *
from rest_framework.permissions import IsAuthenticated, AllowAny




class QuestionView(APIView):
    permission_classes = (AllowAny,)
    def get(self, request):
        questions = Question.objects.all()
        data = QuestionSerializer(questions, many=True).data
        return Response({"questions": data}, status=200)

class CreateContactUs(APIView):
    permission_classes = (AllowAny,)
    def post(self, request):
        payload = request.data
        serializer = ContactUsSerializer(data=payload)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ContactUs(APIView):
    permission_classes = (AllowAny,)
    def get(self, request):
        contact_us = ContactUs.objects.all()
        data = ContactUsSerializer(contact_us, many=True).data
        return Response({"support": data}, status=200)
