from django.db import models
from common.custom_model import AbstractModel
from django.utils.translation import gettext_lazy as _
from django.contrib.postgres.fields import ArrayField
from ckeditor_uploader.fields import RichTextUploadingField
import datetime
import pytz

class Donation(AbstractModel):
    default_options = ArrayField(base_field=models.IntegerField(), default=list([1000, 2000, 5000, 10000, 20000]))
    title_kk = models.CharField(max_length=255, null=True, blank=True)
    title_ru = models.CharField(max_length=255, null=True, blank=True)
    description_kk = RichTextUploadingField(null=True, blank=True)
    description_ru = RichTextUploadingField(null=True, blank=True)
    key = models.CharField(max_length=255, default='kit_2022')
    required = models.PositiveIntegerField()
    start_time = models.DateTimeField(verbose_name=_('Дата начала'), null=True, blank=True)
    end_time = models.DateTimeField(verbose_name=_('Дата конца'), null=True, blank=True)
    
    def __str__(self):
        return self.key

    @property
    def on_process(self) -> bool:
        time = pytz.UTC.localize(datetime.datetime.now())
        if(self.start_time and self.end_time):
            return self.start_time < time < self.end_time
        if(self.start_time):
            return self.start_time < time
        if(self.end_time):
            return time < self.end_time
        return True

    @property
    def collected(self) -> int:
        all_donations = self.donat.filter(status=1).values_list("amount_clear", flat=True)
        sum = 0
        for donation in all_donations:
            sum += donation
        return round(sum / 100, 2)

    class Meta:
        verbose_name = 'Донат проекты'
        verbose_name_plural = 'Донат проекты'
