import json
import os
import subprocess
from obrazovanie.models.video import Video, VideoQuality
import subprocess
import boto3
from django.conf import settings


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

    qualityList = [[854, 480], [1280, 720], [1920, 1080]]

    def __init__(self, id, path):
        self.id = id
        self.path = path
        self.filename = path.split('/')[-1]
        self.extension = self.filename.split('.')[-1]
        self.videoname = '.'.join(self.filename.split('.')[:-1])
        self.directory = os.getcwd()
        self.video = self.get_video_orig()
