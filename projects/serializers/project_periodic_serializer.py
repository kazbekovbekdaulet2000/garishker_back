from rest_framework import serializers
from payment.serializers.donation_project import DonationProjectSerializer
from projects.models.project_periodic import ProjectPeriod
from projects.serializers.project_resourse_serializer import ProjectResourceSerializer
from video.serializers import VideoURLSerializer


class ProjectPeriodSerializer(serializers.ModelSerializer):
    video = VideoURLSerializer(many=False)
    resources = ProjectResourceSerializer(many=True)
    donat = DonationProjectSerializer()

    class Meta:
        model = ProjectPeriod
        fields = ['id', 'name_kk', 'name_ru', 'description_kk',
                  'description_ru', 'status', 'project', 'year',
                  'video', 'resources', 'donat']
