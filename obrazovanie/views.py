from django.shortcuts import render
from rest_framework.views import *
from rest_framework.response import *
from rest_framework import status
from .serializers import *
from .models import Category
from django.db.models import Prefetch


class CategoryView(APIView):
    def get(self, request):
        categories = Category.objects.all()
        data = CategorySerializer(categories, many=True).data
        return Response({"categories": data}, status=200)
    

class DataByCategoryView(APIView):
    lookup_url_kwarg = 'id'

    def get(self, request):
        id = request.GET.get(self.lookup_url_kwarg)
        if id != None:
            category = Category.objects.filter(id=id).prefetch_related(Prefetch('report_category', queryset=Report.objects.select_related('category')),
                                                                       Prefetch('video_category', queryset=Video.objects.select_related('category')))
            if category.exists():
                data = CategoryRelatedDataSerializer(category[0]).data
                return Response(data, status=status.HTTP_200_OK)
            return Response({'Debt data not found': 'Invalid ID'}, status=status.HTTP_404_NOT_FOUND)
        return Response({'Bad request': 'ID parameter not found in request'}, status=status.HTTP_400_BAD_REQUEST)
        

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


class VideoView(APIView):
    def get(self, request):
        videos = Video.objects.all().select_related('section').all().select_related('category').all()
        data = VideoSerializer(videos, many=True).data
        return Response({'videos': data}, status=200)