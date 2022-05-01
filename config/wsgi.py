"""
WSGI config for config project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')

application = get_wsgi_application()


# IMPORTANT
# from django.contrib import admin
# from django_celery_beat.models import (
#     IntervalSchedule,
#     CrontabSchedule,
#     SolarSchedule,
#     ClockedSchedule,
#     PeriodicTask,
# )

# admin.site.unregister(SolarSchedule)
# admin.site.unregister(ClockedSchedule)
# admin.site.unregister(PeriodicTask)
# admin.site.unregister(IntervalSchedule)
# admin.site.unregister(CrontabSchedule)