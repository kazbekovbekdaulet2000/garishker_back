from rest_framework import serializers
from course.models.course.course import Course
from course.models.progress.course_user import CourseUser
from course.serializers.course_user_serializer import CourseUserSerializer
from organizations.serializers.organization_serializer import OrganizationSerializer
from reaction.models.review import Review
from rest_framework.fields import empty
from video.serializers import VideoURLSerializer
from django.contrib.contenttypes.models import ContentType

class CourseSerializer(serializers.ModelSerializer):
    organization = OrganizationSerializer(many=False)
    participant = serializers.SerializerMethodField(read_only=True)

    course_ids = []
    user = None

    def get_participant(self, obj) -> bool:
        if(not self.user.is_anonymous):
            return obj.id in self.course_ids
        return False

    def __init__(self, instance=None, data=empty, **kwargs):
        super().__init__(instance, data, **kwargs)
        self.user = self.context.get('request').user
        if(not self.user.is_anonymous):
            self.course_ids = list(self.user.courses.all().values_list('course', flat=True))

    class Meta:
        model = Course
        exclude = ['to_view']


class CourseDetailSerializer(CourseSerializer):
    teaser = VideoURLSerializer(many=False)
    rating = serializers.SerializerMethodField(read_only=True)
    ratings_count = serializers.SerializerMethodField(read_only=True)
    user_rating = serializers.SerializerMethodField(read_only=True)
    course_instance = serializers.SerializerMethodField()

    def get_course_instance(self, course):
        if(self.user.is_anonymous):
            return None
        queryset = CourseUser.objects.filter(course_id=course.id, user_id=self.user.id).first()
        serializer = CourseUserSerializer(instance=queryset, many=False)
        return serializer.data

    def get_rating(self, obj):
        return sum(list(Review.objects.get_object_by_model(model=Course, id=obj.id).values_list('rating', flat=True)))

    def get_ratings_count(self, obj):
        return Review.objects.get_object_by_model(model=Course, id=obj.id).count()

    def get_user_rating(self, obj):
        if(self.user.is_anonymous):
            return False
        reviews = self.user.review.filter(object_id=obj.id, content_type=ContentType.objects.get_for_model(Course))
        if(len(reviews)>0):
            return True

    class Meta(CourseSerializer.Meta):
        model = Course
        exclude = ['to_view']
