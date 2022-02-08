from celery import shared_task
from obrazovanie.utils import Converter


@shared_task(time_limit=7200)
def video_resize_yandex_storage(id, path):
    videos = Converter(id=id, path=path)
    videos.upload_video()
