from django.shortcuts import get_object_or_404
from rest_framework import serializers
from course.models.course.course import Course
from course.models.progress.course_user import CourseUser


class CourseUserSerializer(serializers.ModelSerializer):
    _course = None

    class Meta:
        model = CourseUser
        fields = ('user', 'course', 'current_lesson', 'completed')
        read_only_fields = ('user', 'course', 'current_lesson', 'completed')

    def validate(self, attrs):
        lookup_field = self.context.get('view').lookup_field
        self._course = get_object_or_404(Course, id=self.context['view'].kwargs[lookup_field])
        return super().validate(attrs)

    def create(self, validated_data):
        validated_data.update({'user': self.context.get('request').user})
        validated_data.update({'course': self._course})
        validated_data.update({'current_lesson': self._course.get_first_lesson()})
        instance, created = CourseUser.objects.get_or_create(**validated_data)
        return instance
