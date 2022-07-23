from rest_framework import serializers
from course.models.course.course import Course
from organizations.serializers.organization_serializer import OrganizationSerializer
from django.contrib.auth.models import AnonymousUser

class CourseSerializer(serializers.ModelSerializer):
    organization = OrganizationSerializer(many=False)
    participant = serializers.SerializerMethodField(read_only=True)

    def get_participant(self, obj) -> bool:
        user = self.context.get('request').user
        if(not user.is_anonymous):
            course_ids = list(user.courses.all().values_list('course', flat=True))
            return obj.id in course_ids
        return False

    class Meta:
        model = Course
        exclude = ['to_view']


class CourseDetailSerializer(CourseSerializer):
    class Meta(CourseSerializer.Meta):
        model = Course
        exclude = ['to_view']
