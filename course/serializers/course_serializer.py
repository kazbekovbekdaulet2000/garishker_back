from rest_framework import serializers
from course.models.course.course import Course
from organizations.serializers.organization_serializer import OrganizationSerializer
from reaction.models.review import Review
from rest_framework.fields import empty
from video.serializers import VideoURLSerializer


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
        self.course_ids = list(
            self.user.courses.all().values_list('course', flat=True))

    class Meta:
        model = Course
        exclude = ['to_view']


class CourseDetailSerializer(CourseSerializer):
    teaser = VideoURLSerializer(many=False)
    rating = serializers.SerializerMethodField(read_only=True)
    ratings_count = serializers.SerializerMethodField(read_only=True)
    completed = serializers.SerializerMethodField(read_only=True)

    def get_rating(self, obj):
        return sum(list(Review.objects.get_object_by_model(model=Course, id=obj.id).values_list('rating', flat=True)))

    def get_ratings_count(self, obj):
        return Review.objects.get_object_by_model(model=Course, id=obj.id).count()

    def get_completed(self, obj):
        if(self.user.is_anonymous):
            return False
        user_course = self.user.courses.filter(course_id=obj.id).first()
        if(user_course):
            return user_course.completed
        return False

    class Meta(CourseSerializer.Meta):
        model = Course
        exclude = ['to_view']
