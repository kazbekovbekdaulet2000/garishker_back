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
from rest_framework import generics, permissions
from .permissions import IsOwnerOrReadOnly
from rest_framework import viewsets
from django.shortcuts import get_object_or_404
from rest_framework import permissions
from rest_framework.permissions import IsAuthenticated, AllowAny



class CategoryView(APIView):
    permission_classes = (AllowAny,)
    def get(self, request):
        categories = Category.objects.all()
        data = CategorySerializer(categories, many=True).data
        return Response({"categories": data}, status=200)
    

class DataByCategoryView(APIView):
    permission_classes = (AllowAny,)
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
    permission_classes = (AllowAny,)
    def get(self, request):
        sections = Section.objects.all()
        data = SectionSerializer(sections, many=True).data
        return Response({"sections": data}, status=200)


class ReportCreate(generics.ListCreateAPIView):
    queryset = Report.objects.all().select_related('category')
    serializer_class = ReportCreateSerializer

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)


class ReportView(generics.ListCreateAPIView):
    permission_classes = (AllowAny,)
    queryset = Report.objects.filter(moderated=True).select_related('category')
    serializer_class = ReportListSerializer


class ReportRelated(APIView):
    lookup_url_kwarg = 'id'

    def get(self, request):
        report = get_object_or_404(Report, id=request.GET.get(self.lookup_url_kwarg))
        queryset = Report.objects.filter(moderated=True).filter(category=report.category).select_related('category').exclude(id=request.GET.get(self.lookup_url_kwarg))

        data = ReportListSerializer(queryset, many=True).data
        return Response(data, status=200)


class ReportDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = (AllowAny,)
    queryset = Report.objects.all()
    serializer_class = ReportDetailSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly,
                          IsOwnerOrReadOnly]


class VideoView(APIView):
    permission_classes = (AllowAny,)
    def get(self, request):
        videos = Video.objects.all().select_related('section').all().select_related('category').all()
        data = VideoSerializer(videos, many=True).data
        return Response({'videos': data}, status=200)


class SearchView(generics.ListAPIView):
    permission_classes = (AllowAny,)
    queryset = Report.objects.all()
    serializer_class = ReportListSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = SearchFilter


class ReportFavourites(APIView):
    def post(self, request):
        report = get_object_or_404(Report, id=request.data.get('id'))
        if request.user not in report.favourite.all():
            report.favourite.add(request.user)
            return Response({'detail': 'Added to favourites'}, status=status.HTTP_200_OK)
        return Response({'detail': 'You already added to favourites'}, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request):
        report = get_object_or_404(Report, id=request.data.get('id'))
        if request.user in report.favourite.all():
            report.favourite.remove(request.user)
            return Response({'detail': 'Removed from favourites'}, status=status.HTTP_204_NO_CONTENT)
        return Response({'detail': 'You already removed from favourites'}, status=status.HTTP_400_BAD_REQUEST)


class ListOfFavourites(APIView):
    def get(self, request):
        reports = Report.objects.filter(favourite=request.user)
        data = ReportListSerializer(reports, many=True).data
        return Response({"reports": data}, status=200)


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
        print(serializer)
        if serializer.is_valid():
            print(serializer.validated_data)
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
