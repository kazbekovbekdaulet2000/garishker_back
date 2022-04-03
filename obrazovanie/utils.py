import json
import os
import subprocess
import django_filters
from django_filters import rest_framework as filters
from obrazovanie.models.report import Report
from obrazovanie.models.video import Video, VideoQuality
import subprocess
import boto3
from django.conf import settings


class ReportSearchFilter(filters.FilterSet):
    title = django_filters.CharFilter(lookup_expr='icontains')

    class Meta:
        model = Report
        fields = ['title', 'category']


class VideoSearchFilter(filters.FilterSet):
    title = django_filters.CharFilter(lookup_expr='icontains')

    class Meta:
        model = Video
        fields = ['title_ru', 'category']


class Converter:
    session = boto3.session.Session(
        aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
        aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY,
        region_name=settings.AWS_S3_REGION_NAME
    )

    s3 = session.client(
        service_name='s3',
        endpoint_url=settings.AWS_S3_ENDPOINT_URL
    )

    width = None
    height = None

    qualityList = [[640, 360], [854, 480], [1280, 720], [1920, 1080]]

    def __init__(self, id, path):
        self.id = id
        self.path = path
        self.filename = path.split('/')[-1]
        self.extension = self.filename.split('.')[-1]
        self.videoname = '.'.join(self.filename.split('.')[:-1])
        self.directory = os.getcwd()
        self.video = self.get_video_orig()

    def upload_video(self):
        status = self.get_video_orig().convert_status
        if(not (status == 'converted' or status == 'started')):
            self.s3.download_file(Bucket='garysh-app',
                                  Key=f'video-video/{self.path}',
                                  Filename=f"media/{self.filename}")
            self.get_video_resolution()
            self.post_resized_videos()

    def get_video_resolution(self):
        video_meta = self.get_video_metadata()
        data, err = video_meta.communicate()
        if video_meta.returncode == 0:
            metadata = json.loads(data.decode('utf-8'))
            self.width = metadata['streams'][0]['width']
            self.height = metadata['streams'][0]['height']
            self.save_original_quality(self.height)
        else:
            print("Error:", err)

    def save_original_quality(self, quality):
        self.video.set_quality(quality)

    def get_video_metadata(self):
        video_meta = subprocess.Popen(
            f"ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of json media/{self.filename}", shell=True, stdout=subprocess.PIPE)
        video_meta.wait()
        return video_meta

    def post_resized_videos(self):
        for size in self.qualityList:
            self.update_video('started')
            if(self.height > size[1]):
                try:
                    file = self.convert_video(size[0], size[1])
                    self.video.video_quality.add(file)
                    self.video.save()
                except:
                    self.update_video('error')
                    return
        self.update_video('converted')
        self.remove_video_file(
            f'{self.directory}/media/{self.videoname}.{self.extension}')

    def convert_video(self, w, h):
        res2 = subprocess.Popen(
            f'ffmpeg -i {self.directory}/media/{self.videoname}.{self.extension} -vf scale=-2:{h} -c:v libx264 -crf 18 -preset veryfast -c:a copy {self.directory}/media/{self.videoname}_{h}p.{self.extension}', shell=True)
        res2.wait()

        self.s3.upload_file(
            Bucket='garysh-app',
            Key=f"video-video/{self.videoname}_{h}p.{self.extension}",
            Filename=f'{self.directory}/media/{self.videoname}_{h}p.{self.extension}'
        )

        self.remove_video_file(
            f'{self.directory}/media/{self.videoname}_{h}p.{self.extension}')

        return VideoQuality.objects.create(
            path=f"{self.videoname}_{h}p.{self.extension}", quality=h, width=w, height=h)

    def get_video_orig(self):
        return Video.objects.get(pk=self.id)

    def update_video(self, message):
        video = self.get_video_orig()
        video.convert_status = message
        video.save()

    def remove_video_file(self, dir):
        os.remove(dir)
