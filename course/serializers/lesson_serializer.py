from django.conf import settings
from rest_framework import serializers
from course.models.lesson import Lesson
from course.models.participant import Participant
from course.serializers.lector_serializer import LectorDetailSerializer, LectorSerializer
from organizations.serializers.organization_serializer import OrganizationSerializer
from django.contrib.contenttypes.models import ContentType


class LessonSerializer(serializers.ModelSerializer):
    finished = serializers.SerializerMethodField(default=False)
    attempts = serializers.SerializerMethodField(default=0)
    lector = LectorSerializer(many=False, read_only=True)

    def get_finished(self, obj) -> bool:
        if(self.context['request'].user.is_anonymous):
            return False
        return Participant.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Lesson),
            object_id=obj.id,
            success=True).count() > 0

    def get_attempts(self, obj) -> int:
        if(self.context['request'].user.is_anonymous):
            return 0
        return Participant.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Lesson),
            object_id=obj.id).count()

    class Meta:
        model = Lesson
        fields = ['id', 'name_kk', 'name_ru', 'description_kk',
                  'description_ru', 'duriation', 'finished', 'attempts', 'lector', 'order']


class LessonDetailSerializer(serializers.ModelSerializer):
    organization = OrganizationSerializer(
        source="course.organization", many=False)
    category = serializers.PrimaryKeyRelatedField(source="course.category", many=False, read_only=True)
    lector = LectorDetailSerializer(many=False)
    video = serializers.SerializerMethodField(read_only=True)
    participated = serializers.SerializerMethodField(default=False)
    test_id = serializers.PrimaryKeyRelatedField(source='course_test', many=False, read_only=True)

    def get_participated(self, obj) -> bool:
        if(self.context['request'].user.is_anonymous):
            return False
        return Participant.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Lesson),
            object_id=obj.id).count() > 0

    def get_video(self, obj):
        if(not obj.video):
            return None
        return f"{settings.AWS_S3_ENDPOINT_URL}/garysh-app/course-video/{obj.video}"

    class Meta:
        model = Lesson
        fields = ['id', 'name_kk', 'name_ru', 'description_kk', 'description_ru',
                  'duriation', 'organization', 'category', 'lector', 'video', 'modules',
                  'participated', 'test_id', 'order']
