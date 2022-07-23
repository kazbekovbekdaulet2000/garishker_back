from rest_framework import serializers
from course.models.course.lesson import Lesson
from course.serializers.lector_serializer import LectorDetailSerializer, LectorSerializer
from organizations.serializers.organization_serializer import OrganizationSerializer
from video.serializers import VideoURLSerializer


class LessonSerializer(serializers.ModelSerializer):
    lector = LectorSerializer(many=False, read_only=True)

    class Meta:
        model = Lesson
        fields = ['id', 'name_kk', 'name_ru', 'description_kk',
                  'description_ru', 'duriation', 'lector', 'order']


class LessonDetailSerializer(serializers.ModelSerializer):
    organization = OrganizationSerializer(source="course.organization", many=False)
    category = serializers.PrimaryKeyRelatedField(source="course.category", many=False, read_only=True)
    lector = LectorDetailSerializer(many=False)
    video = VideoURLSerializer(many=False)

    class Meta:
        model = Lesson
        fields = ['id', 'name_kk', 'name_ru', 'description_kk', 'description_ru',
                  'duriation', 'organization', 'category', 'lector', 'video', 'order']
