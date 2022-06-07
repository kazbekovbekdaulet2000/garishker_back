import json
from celery import shared_task
from django.conf import settings
from common.contants import VIDEO_QUALITIES
from video.converter.new_converter import NewConverter
import logging
from video.models.video_quality_item import VideoQualityURL
from video.models.video_url import VideoURL


@shared_task(time_limit=7200)
def video_transcode(id, url):
    video = NewConverter(url)
    bucket_dir = url.split(f"{settings.BUCKET_NAME}/")[-1]
    if not video.file:
        video.file = video.download_from_storage(bucket_dir)
        if(video.file == None): 
            return 'File 404 on s3'
    obj = VideoURL.objects.get(pk=id)
    meta = video.video_metadata
    data, err = meta.communicate()
    if meta.returncode == 0:
        metadata = json.loads(data.decode('utf-8'))
        orig_height = metadata['streams'][0]['height']
        obj.original_quality = orig_height
        obj.save()
        for size in VIDEO_QUALITIES:
            w, h = size
            if(orig_height > h):
                try:
                    obj.convert_status = 'started'
                    thumb = VideoQualityURL.objects.create(video_id=id, quality=h, url=video.process(bucket_dir, h))
                    thumb.save()
                    obj.save()
                except:
                    obj.convert_status = 'error'
                    obj.save()
                    return "Error"
            obj.convert_status = 'converted'
            obj.save()
    else:
        logging.debug(f"Error: {err}")

    video.remove_file(video.file.dir)

    