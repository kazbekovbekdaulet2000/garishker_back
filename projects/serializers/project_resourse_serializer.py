from rest_framework import serializers
from projects.models.project_resourse import ProjectResource


class ProjectResourceSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProjectResource
        fields = ['name_kk', 'name_ru', 'file']
