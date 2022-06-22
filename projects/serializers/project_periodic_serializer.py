import resource
from rest_framework import serializers
from projects.models.project_periodic import ProjectPeriod
from projects.serializers.project_resourse_serializer import ProjectResourceSerializer
from video.models.video_url import VideoURL
from video.serializers import VideoURLSerializer


class ProjectPeriodSerializer(serializers.ModelSerializer):
    video = serializers.SerializerMethodField()
    resources = ProjectResourceSerializer(many=True)

    def get_video(self, obj):
        data = VideoURL.objects.get_object_by_model(model=ProjectPeriod, id=obj.id)
        if data:
            return VideoURLSerializer(data[0], many=False).data
        return None

    class Meta:
        model = ProjectPeriod
        fields = ['id', 'name_kk', 'name_ru', 'description_kk',
                  'description_ru', 'status', 'project', 'year',
                  'required_amount', 'collected_amount', 'video', 'resources']
