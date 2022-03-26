from email.policy import default
from rest_framework import serializers
from course.models.course import Course
from course.models.lesson import Lesson
from course.models.participant import Participant
from course.serializers.lector_serializer import LectorSerializer
from obrazovanie.serializers.categorty_serizializers import CategorySerializer
from organizations.serializers.organization_serializer import OrganizationSerializer
from django.contrib.contenttypes.models import ContentType
from rating.models import Rating


class CourseSerializer(serializers.ModelSerializer):
    organization = OrganizationSerializer(many=False)
    category = CategorySerializer(many=False)
    lectors = LectorSerializer(many=True)
    inprogress = serializers.SerializerMethodField()
    closed_lessons = serializers.SerializerMethodField()

    def get_inprogress(self, obj) -> bool:
        return Participant.objects.filter(
            content_type=ContentType.objects.get_for_model(Course),
            object_id=obj.id).count() > 0

    def get_closed_lessons(self, obj) -> int:
        ids = []
        for lesson in obj.course_lesson.all():
            ids.append(lesson.id)
        return Participant.objects.filter(
            user=self.context['request'].user,
            content_type=ContentType.objects.get_for_model(Lesson),
            object_id__in=ids).count()

    class Meta:
        model = Course
        exclude = ['to_view']


class CourseDetailSerializer(CourseSerializer):
    ratings_count = serializers.SerializerMethodField(read_only=True)

    def get_ratings_count(self, obj) -> int:
        return len(Rating.objects.filter(
            content_type=ContentType.objects.get_for_model(Course),
            object_id=obj.id))

    class Meta(CourseSerializer.Meta):
        model = Course
        exclude = ['to_view']
