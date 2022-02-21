from celery import shared_task
from django.core.mail import send_mail, get_connection, send_mass_mail
from django.conf import settings

connection = get_connection(
    host=settings.EMAIL_HOST,
    port=settings.EMAIL_PORT,
    username=settings.EMAIL_HOST_USER,
    password=settings.EMAIL_PASSWORD,
    use_tls=settings.EMAIL_USE_TLS
)


@shared_task
def send_gmail(mail):
    return send_mail(subject='Регистрация',
                     message='Мы вам прислали это письмо сказать спасибо и тд',
                     from_email=settings.EMAIL_HOST_USER,
                     recipient_list=[mail],
                     connection=connection)


@shared_task
def send_reset_code(mail, code):
    return send_mail(subject='Восстановление пароля',
                     message=code,
                     from_email=settings.EMAIL_HOST_USER,
                     recipient_list=[mail],
                     connection=connection)


@shared_task
def mass_mailing(*args, **kwargs):
    return send_mail(subject='Массовые сообщение',
                     message='Мы вам прислали это письмо сказать спасибо и тд',
                     from_email=settings.EMAIL_HOST_USER,
                     recipient_list=[
                         "kazbekov.bekdaulet2000@gmail.com", "bonlyoone@gmail.com"],
                     #  html_message="<h1>Hello</h1>",
                     connection=connection)


@shared_task
def send_gmail_me():
    return send_mail(subject='Регистрация',
                     message='Мы вам прислали это письмо сказать спасибо и тд',
                     from_email=settings.EMAIL_HOST_USER,
                     recipient_list=["kazbekov.bekdaulet2000@gmail.com"],
                     html_message="<h1>Hello</h1>",
                     connection=connection)
