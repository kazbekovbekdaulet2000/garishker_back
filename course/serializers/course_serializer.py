from rest_framework import serializers
from course.models.course import Course
from course.models.lesson import Lesson
from course.models.participant import Participant
from course.serializers.lector_serializer import LectorDetailSerializer, LectorSerializer
from organizations.serializers.organization_serializer import OrganizationSerializer
from django.contrib.contenttypes.models import ContentType
from rating.models import Rating


class CourseSerializer(serializers.ModelSerializer):
    organization = OrganizationSerializer(many=False)
    lectors = LectorSerializer(many=True)
    inprogress = serializers.SerializerMethodField()
    closed_lessons = serializers.SerializerMethodField()

    def get_inprogress(self, obj) -> bool:
        try:
            return Participant.objects.filter(
                user=self.context['request'].user,
                content_type=ContentType.objects.get_for_model(Course),
                object_id=obj.id).count() > 0
        except:
            return False

    def get_closed_lessons(self, obj) -> int:
        try:
            ids = []
            for lesson in obj.course_lesson.all():
                ids.append(lesson.id)
            return Participant.objects.filter(
                user=self.context['request'].user,
                content_type=ContentType.objects.get_for_model(Lesson),
                object_id__in=ids,
                success=True).count()
        except:
            return 0

    class Meta:
        model = Course
        exclude = ['to_view']


class CourseDetailSerializer(CourseSerializer):
    ratings_count = serializers.SerializerMethodField(read_only=True)
    lectors = LectorDetailSerializer(many=True)
    finished = serializers.SerializerMethodField(read_only=True)
    max_points = serializers.SerializerMethodField(read_only=True)
    points = serializers.SerializerMethodField(read_only=True)

    def get_finished(self, obj) -> bool:
        if(self.context['request'].user.is_anonymous):
            return False
        return Participant.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Course),
            object_id=obj.id,
            success=True).count() > 0

    def get_max_points(self, obj) -> int:
        if(self.context['request'].user.is_anonymous):
            return None
        par = Participant.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Course),
            object_id=obj.id,
            success=True)
        if(par.count() > 0):
            return par.last().max_points

    def get_points(self, obj) -> int:
        if(self.context['request'].user.is_anonymous):
            return None
        par = Participant.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Course),
            object_id=obj.id,
            success=True)
        if(par.count() > 0):
            return par.last().points

    def get_ratings_count(self, obj) -> int:
        return len(Rating.objects.filter(
            content_type=ContentType.objects.get_for_model(Course),
            object_id=obj.id))

    class Meta(CourseSerializer.Meta):
        model = Course
        exclude = ['to_view']
