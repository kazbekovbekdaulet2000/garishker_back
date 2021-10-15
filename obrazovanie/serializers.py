from rest_framework import serializers
from .models import *
from user.models import Profile, User

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['name']


class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Section
        fields = '__all__'


class ReportCreateSerializer(serializers.ModelSerializer):
    author = serializers.ReadOnlyField(source='author.email')
    
    class Meta:
        model = Report
        fields = ['id', 'title', 'image', 'created_at', 'category', 'author']


class ReportDetailSerializer(ReportCreateSerializer):
    class Meta(ReportCreateSerializer.Meta):
        fields = ReportCreateSerializer.Meta.fields + ['body']


class ReportListSerializer(ReportCreateSerializer):
    category = CategorySerializer()

    class Meta(ReportCreateSerializer.Meta):
        fields = ReportCreateSerializer.Meta.fields + ['category']


class VideoSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)
    section = SectionSerializer(read_only=True)

    class Meta:
        model = Video
        fields = ['title', 'body', 'section', 'video', 'created_at', 'category']


class CategoryRelatedDataSerializer(serializers.ModelSerializer):
    report_category = ReportListSerializer(many=True)
    video_category = VideoSerializer(many=True)

    class Meta:
        model = Category
        fields = ['report_category', 'video_category']



class CustomUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ('full_name', )

class PostLikeListSerializer(serializers.ModelSerializer):
    likes = CustomUserSerializer(many=True, read_only=True) #likes is in Post model with foreign key to user Model
    class Meta:
        model = Report
        fields = ['likes',]


# class PostSerializer(serializers.ModelSerializer):
#     owner = serializers.ReadOnlyField(source='author.email')
#     comments = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

#     class Meta:
#         model = Report
#         fields = ['id', 'title', 'body', 'owner', 'comments']


class UserSerializer(serializers.ModelSerializer):
    posts = serializers.PrimaryKeyRelatedField(many=True, read_only=True)
    comments = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

    class Meta:
        model = User
        fields = ['id', 'email', 'posts', 'comments']

class CommentSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.email')
    

    class Meta:
        model = Comment
        fields = ['id', 'body', 'owner', 'reply', 'report']

class CreateCommentSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Comment
        fields = ['id', 'body', 'owner', 'reply', 'report']

class DeleteCommentSerializer(serializers.ModelSerializer):

    class Meta:
        model = Comment
        fields = ['id', 'owner', 'report']