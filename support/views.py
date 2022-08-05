from rest_framework import permissions
from rest_framework import generics
from support.models import ContactUs, EmailRequests, Question
from support.serializers import ContactUsSerializer, EmailRequestSerializer, QuestionSerializer


class QuestionListView(generics.ListAPIView):
    permission_classes = [permissions.AllowAny, ]
    serializer_class = QuestionSerializer
    queryset = Question.objects.all()
    pagination_class = None


class ContactListView(generics.ListCreateAPIView):
    permission_class = [permissions.AllowAny, ]
    serializer_class = ContactUsSerializer
    queryset = ContactUs.objects.all()
    pagination_class = None


class EmailRequestView(generics.CreateAPIView):
    permission_class = [permissions.AllowAny, ]
    serializer_class = EmailRequestSerializer
    queryset = EmailRequests.objects.all()