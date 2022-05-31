from django.contrib.sitemaps import Sitemap
from obrazovanie.models.report import Report
from obrazovanie.models.video import Video


class ReportSiteURL:
    domain = 'garyshker.com/edu/reports/'

class VideoSiteURL:
    domain = 'garyshker.com/edu/videos/'

class ReportViewSitemap(Sitemap):
    changefreq = "daily"
    priority = 0.8
    protocol = 'https'

    def get_urls(self, site=None, **kwargs):
        site = ReportSiteURL()
        return super(ReportViewSitemap, self).get_urls(site=site, **kwargs)

    def items(self):
        return Report.objects.filter(moderated=True)

    def location(self, obj):
        return obj.id

    def lastmod(self, obj):
        return obj.updated_at


class VideoViewSitemap(Sitemap):
    changefreq = "daily"
    priority = 0.8
    protocol = 'https'

    def get_urls(self, site=None, **kwargs):
        site = VideoSiteURL()
        return super(VideoViewSitemap, self).get_urls(site=site, **kwargs)

    def items(self):
        return Video.objects.all()

    def location(self, obj):
        return obj.id

    def lastmod(self, obj):
        return obj.updated_at
