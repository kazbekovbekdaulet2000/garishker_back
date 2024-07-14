from rest_framework import serializers
from .models import *


class ContactUsSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContactUs
        fields = '__all__'


class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = '__all__'

    
class EmailRequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmailRequests
        fields = ['email', ]
    