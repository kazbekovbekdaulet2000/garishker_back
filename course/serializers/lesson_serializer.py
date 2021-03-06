from rest_framework import serializers
from course.models.course import Course
from course.models.lesson import Lesson
from course.models.participant import Participant
from course.serializers.lector_serializer import LectorDetailSerializer, LectorSerializer
from organizations.serializers.organization_serializer import OrganizationSerializer
from django.contrib.contenttypes.models import ContentType

from video.models.video_url import VideoURL
from video.serializers import VideoURLSerializer


class LessonSerializer(serializers.ModelSerializer):
    finished = serializers.SerializerMethodField()
    lector = LectorSerializer(many=False, read_only=True)
    accessible = serializers.SerializerMethodField()

    def get_finished(self, obj) -> bool:
        if(self.context['request'].user.is_anonymous):
            return False
        return Participant.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Lesson),
            object_id=obj.id,
            success=True).count() > 0

    def get_accessible(self, obj) -> bool:
        if(self.context['request'].user.is_anonymous):
            return obj.order == 1
        else:
            participant = Participant.objects.filter(
                user=self.context['request'].user,
                content_type=ContentType.objects.get_for_model(Lesson),
                object_id=obj.id
            )
            if(participant.count() > 0):
                return participant.last().access
            return obj.order == 1

    class Meta:
        model = Lesson
        fields = ['id', 'name_kk', 'name_ru', 'description_kk',
                  'description_ru', 'duriation', 'finished', 'accessible', 'lector', 'order']


class LessonDetailSerializer(serializers.ModelSerializer):
    organization = OrganizationSerializer(source="course.organization", many=False)
    category = serializers.PrimaryKeyRelatedField(source="course.category", many=False, read_only=True)
    lector = LectorDetailSerializer(many=False)
    video = VideoURLSerializer(many=False)
    course_participation = serializers.SerializerMethodField(default=False)
    test_id = serializers.PrimaryKeyRelatedField(source='course_test', many=False, read_only=True)

    def get_course_participation(self, obj) -> bool:
        if(self.context['request'].user.is_anonymous):
            return False
        return Participant.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Course),
            object_id=obj.course.id).count() > 0

    class Meta:
        model = Lesson
        fields = ['id', 'name_kk', 'name_ru', 'description_kk', 'description_ru',
                  'duriation', 'organization', 'category', 'lector', 'video', 'modules',
                  'course_participation', 'test_id', 'order']
