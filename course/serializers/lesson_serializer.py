from rest_framework import serializers
from course.models.course.lesson import Lesson
from course.serializers.lector_serializer import LectorDetailSerializer, LectorSerializer
from organizations.serializers.organization_serializer import OrganizationSerializer
from video.serializers import VideoURLSerializer


class LessonSerializer(serializers.ModelSerializer):
    lector = LectorSerializer(many=False, read_only=True)
    current = serializers.SerializerMethodField(read_only=True)

    user = None
    user_course = None

    def get_current(self, obj) -> bool:
        if(self.user.is_anonymous):
            return False
        if(self.user_course):
            return self.user_course.current_lesson.id == obj.id
        return False

    def __init__(self, instance=None, data=..., **kwargs):
        super().__init__(instance, data, **kwargs)
        self.user = self.context['request'].user
        self.user_course = self.context['view'].user_course


    class Meta:
        model = Lesson
        fields = ['id', 'name_kk', 'name_ru', 'description_kk',
                  'description_ru', 'duriation', 'lector', 'order', 'current', 'quiz']


class LessonDetailSerializer(serializers.ModelSerializer):
    organization = OrganizationSerializer(source="course.organization", many=False)
    category = serializers.PrimaryKeyRelatedField(source="course.category", many=False, read_only=True)
    lector = LectorDetailSerializer(many=False)
    video = VideoURLSerializer(many=False)
    current = serializers.SerializerMethodField(read_only=True)

    def get_current(self, obj) -> bool:
        user = self.context['request'].user
        user_course = self.context['view'].user_course
        if(user.is_anonymous):
            return False
        if(user_course):
            return user_course.current_lesson.id == obj.id
        return False

    class Meta:
        model = Lesson
        fields = ['id', 'name_kk', 'name_ru', 'description_kk', 'description_ru',
                  'duriation', 'organization', 'category', 'lector', 'video', 'order', 'current', 'quiz']
