from django.shortcuts import render
from rest_framework.views import *
from rest_framework.response import *
from rest_framework import status


class Index(APIView):
    def get(self, request):
        return Response("Success", status=200)