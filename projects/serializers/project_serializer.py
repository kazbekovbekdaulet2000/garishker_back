from rest_framework import serializers
from projects.models.project import Project
from projects.serializers.project_periodic_serializer import ProjectPeriodSerializer


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ['id', 'name_kk', 'name_ru',
                  'description_kk', 'description_ru', 'status']


class ProjectDetailSerializer(ProjectSerializer):
    children = ProjectPeriodSerializer(many=True)
    
    class Meta:
        model = ProjectSerializer.Meta.model
        fields = ProjectSerializer.Meta.fields + ['children']
