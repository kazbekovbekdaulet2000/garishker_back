from rest_framework import serializers
from projects.models.project_periodic import ProjectPeriod
from video.models.video_url import VideoURL
from video.serializers import VideoURLSerializer


class ProjectPeriodSerializer(serializers.ModelSerializer):
    video = serializers.SerializerMethodField()

    def get_video(self, obj):
        data = VideoURL.objects.get_object_by_model(model=ProjectPeriod, id=obj.id)
        print(data)
        if data:
            return VideoURLSerializer(data[0], many=False).data
        return None

    class Meta:
        model = ProjectPeriod
        fields = ['id', 'name_kk', 'name_ru', 'description_kk',
                  'description_ru', 'status', 'project', 'year',
                  'required_amount', 'collected_amount', 'video']
