from django.shortcuts import render
from rest_framework.views import *
from rest_framework.response import *
from rest_framework import status
from .models import *
from .serializers import *
from django.shortcuts import get_object_or_404


class Projects(APIView):
    def get(self, request):
        projects = Dobro.objects.all()
        data = DobroSerializer(projects, many=True).data
        return Response(data, status=200)


class ProjectDetail(APIView):
    def get(self, request, id):
        project = Dobro.objects.get(id=id)
        data = DobroDetailSerializer(project).data
        return Response(data, status=200)