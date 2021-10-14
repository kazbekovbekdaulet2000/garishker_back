from django.shortcuts import render
from rest_framework.views import *
from rest_framework.response import *
from rest_framework import status
from .serializers import *
from .models import Category
from django.db.models import Prefetch
from .utils import *
from rest_framework import status, generics
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from django.shortcuts import get_object_or_404
from rest_framework import permissions


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


class SearchView(generics.ListAPIView):
    queryset = Report.objects.all()
    serializer_class = ReportSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = SearchFilter

class LikeView(APIView):
    lookup_url_kwarg = 'id'
    def get(self, request):
        id = request.GET.get(self.lookup_url_kwarg)
        post = Report.objects.get(id=id)
        post.likes.add(request.user)
        return Response({'result':'The post was successfully liked!'})
class UnlikeView(APIView):
    lookup_url_kwarg = 'id'
    def get(self, request):
        id = request.GET.get(self.lookup_url_kwarg)
        post = Report.objects.get(id=id)
        post.likes.remove(request.user)
        return Response({'result':'Like has been successfully removed from the post!'})

class CommentCreate(APIView):
    def post(self, request, format=None):
        user = User.objects.filter(email=request.user)
        payload = request.data
        payload['owner'] = user[0].id
        serializer = CreateCommentSerializer(data=payload)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CommentDelete(APIView):
    def delete(self, request):
        try:
            payload = request.data
            comment = Comment.objects.get(id = payload['id'])
            comment.delete()
            return Response("Comment deleted successfully.")
        except:
            return Response("There is no comment with this id.")

class CommentList(generics.ListCreateAPIView):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)
