from importlib import resources
from xmlrpc.client import boolean
from django.conf import settings
from rest_framework import serializers
from course.models.lesson import Lesson
from course.models.participant import Participant
from course.serializers.lector_serializer import LectorSerializer
from course.serializers.resource_serializer import ResourceSerializer
from obrazovanie.serializers.categorty_serizializers import CategorySerializer
from organizations.serializers.organization_serializer import OrganizationSerializer
from django.contrib.contenttypes.models import ContentType


class LessonSerializer(serializers.ModelSerializer):
    finished = serializers.SerializerMethodField(default=False)

    def get_finished(self, obj):
        return Participant.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Lesson),
            object_id=obj.id).count() > 0

    class Meta:
        model = Lesson
        fields = ['id', 'name_kk', 'name_ru', 'description_kk',
                  'description_ru', 'duriation', 'finished']


class LessonDetailSerializer(serializers.ModelSerializer):
    organization = OrganizationSerializer(
        source="course.organization", many=False)
    category = CategorySerializer(source="course.category", many=False)
    lector = LectorSerializer(many=False)
    video = serializers.SerializerMethodField(read_only=True)
    participated = serializers.SerializerMethodField(default=False)
    # resources = ResourceSerializer(many=True)

    def get_participated(self, obj):
        return Participant.objects.filter(
            content_type=ContentType.objects.get_for_model(Lesson),
            object_id=obj.id).count() > 0

    def get_video(self, obj):
        if(not obj.video):
            return None
        return f"{settings.AWS_S3_ENDPOINT_URL}/garysh-app/course-video/{obj.video}"

    class Meta:
        model = Lesson
        fields = ['id', 'name_kk', 'name_ru', 'description_kk', 'description_ru',
                  'duriation', 'organization', 'category', 'lector', 'video', 'modules', 'participated']
