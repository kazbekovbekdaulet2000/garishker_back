import os
import subprocess

import subprocess
import boto3
import botocore
from django.conf import settings
from video.converter.fIle_reader import FileReader


class NewConverter:
    session = boto3.session.Session(
        aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
        aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY,
        region_name=settings.AWS_S3_REGION_NAME
    )

    s3_client = session.client(
        service_name='s3',
        endpoint_url=settings.AWS_S3_ENDPOINT_URL
    )

    dir = os.getcwd()
    file = None

    def __init__(self, url):
        self.url = url

    def upload_and_presign(self, file_path, object_name):
        client = self.s3_client
        bucket = settings.BUCKET_NAME
        client.upload_file(file_path, bucket, object_name)
        return client.generate_presigned_url('get_object', Params={'Bucket': bucket, 'Key': object_name}, ExpiresIn=3600)

    def download_from_storage(self, bucket_dir) -> FileReader:
        client = self.s3_client
        file = FileReader(bucket_dir)
        save_path = f"{self.dir}/media/{file.file_name}"
        try: 
            client.download_file(Bucket=settings.BUCKET_NAME, Key=bucket_dir, Filename=save_path)
        except botocore.exceptions.ClientError as e:
            if e.response['Error']['Code'] == "404":
                return None
        return FileReader(save_path)

    @property
    def video_metadata(self):
        video_meta = subprocess.Popen(f"ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of json media/{self.file.file_name}", shell=True, stdout=subprocess.PIPE)
        video_meta.wait()
        return video_meta

    def process(self, bucket_dir, quality) -> str:
        res = subprocess.Popen(['ffmpeg', '-i', self.file.dir, '-vf', f'scale=-2:{quality}', '-c:v', 'libx264', '-crf', '18', '-preset', 'veryfast', '-c:a', 'copy', self.file.quality_path(quality)])
        res.wait()
        result_url = self.upload_and_presign(self.file.quality_path(quality), f"{'/'.join(bucket_dir.split('/')[:-1])}/{self.file.quality_name(quality)}")
        self.remove_file(self.file.quality_path(quality))
        return str(result_url)

    def remove_file(self, dir):
        os.remove(dir)

    def download(self):
        return self.s3_client.get_object(self.url)