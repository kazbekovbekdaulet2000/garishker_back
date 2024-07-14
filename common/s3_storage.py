from storages.backends.s3boto3 import S3Boto3Storage


class S3Storage(S3Boto3Storage):
    bucket_name = 'media'
    file_overwrite = True
