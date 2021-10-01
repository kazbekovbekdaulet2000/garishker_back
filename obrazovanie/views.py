from django.shortcuts import render
from rest_framework.views import *
from rest_framework.response import *
from rest_framework import status
from .serializers import *
from .models import Category


class CategoryView(APIView):
    def get(self, request):
        categories = Category.objects.all()
        data = CategorySerializer(categories, many=True).data
        return Response({"categories": data}, status=200)


class SectionView(APIView):
    def get(self, request):
        sections = Section.objects.all()
        data = SectionSerializer(sections, many=True).data
        return Response({"sections": data}, status=200)


class ReportView(APIView):
    def get(self, request):
        reports = Report.objects.all().select_related('category')
        data = ReportSerializer(reports, many=True).data
        return Response({"reports": data}, status=200)