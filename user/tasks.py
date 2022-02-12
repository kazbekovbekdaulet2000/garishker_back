from celery import shared_task
from django.core.mail import send_mail
from django.conf import settings


@shared_task
def send_gmail(mail):
    return send_mail(subject='Регистрация',
                     message='Мы вам прислали это письмо сказать спасибо и тд',
                     from_email=settings.EMAIL_HOST_USER,
                     recipient_list=[mail],
                     html_message="<h1>Hello</h1>")


@shared_task
def send_gmail_me():
    return send_mail(subject='Регистрация',
                     message='Мы вам прислали это письмо сказать спасибо и тд',
                     from_email=settings.EMAIL_HOST_USER,
                     recipient_list=["kazbekov.bekdaulet2000@gmail.com"],
                     html_message="<h1>Hello</h1>")
