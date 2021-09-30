from django.db import models


# Категории
class Category(models.Model):
    name = models.CharField(max_length=120)

    def __str__(self):
        return self.name


# Разделы
class Section(models.Model):
    name = models.CharField(max_length=120)

    def __str__(self):
        return self.name


# Статьи
class Report(models.Model):
    title = models.CharField(max_length=500)
    body = models.TextField()
    category = models.ForeignKey(Category, on_delete=models.DO_NOTHING, related_name='report_category')
    # author = models.ForeignKey(User, on_delete=models.DO_NOTHING, related_name='report_author')
    image = models.FileField(upload_to='report-image')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title


# Видеролики
class Video(models.Model):
    title = models.CharField(max_length=500)
    body = models.TextField()
    category = models.ForeignKey(Category, on_delete=models.DO_NOTHING, related_name='video_category')
    section = models.ForeignKey(Section, on_delete=models.DO_NOTHING, related_name='video_section')
    video = models.FileField(upload_to='video-image')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title