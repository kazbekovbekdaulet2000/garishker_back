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

# """<img src="https://app.garyshker-app.kz/media/video-image/nagimuwa_travel_qanda_interes_cover.png">"""


@shared_task
def send_gmail(mail):
    return send_mail(subject='Регистрация',
                     message='Cпасибо!!!',
                     from_email=settings.EMAIL_HOST_USER,
                     recipient_list=[mail],
                     html_message="""<html><head>  <link rel="preconnect" href="https://fonts.googleapis.com">  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>  <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300;400;600;700&display=swap"    rel="stylesheet">  <style>    body {      font-family: 'Source Sans Pro', sans-serif;      padding: 0px;      margin: 0px;    }    .content {      padding-top: 24px;      padding-bottom: 16px;      background-color: #0C0B15;    }    .holder {      margin: 64px auto 48px auto;      width: 50%;      min-width: 512px;      font-weight: 400;      font-size: 18px;      line-height: 28px;      color: #fff;    }    .top-image {      width: 145px;      object-fit: cover;    }    .bottom-bar {      display: flex;      /* align-items: center; */    }    .bottom-image{      width: 120px;      height: 120px;      object-fit: cover;    }    .bottom-bar-text {      max-width: 300px;      margin-top: 40px    }  </style></head><body>  <div class="content">    <div class="holder">      <a href="#"><img class="top-image" src="https://app.garyshker-app.kz/media/mail_message/logo.png" alt=""></a>      <h2>Привет</h2>      <p>Cпасибо что присоединился к Garyshker. Теперь ты имеешь полный доступ к нашей платформе.</p>      <p>Сейчас ты уже не просто зритель, а полноценный участник сообщества, который может оценивать и обсуждать        контент.      </p>      <p>Давай развиваться вместе :)</p>      <div class="bottom-bar">        <div><a href="#"><img class="bottom-image" src="https://app.garyshker-app.kz/media/mail_message/sticker_love.png" alt=""></a></div>        <div class="bottom-bar-text"> С наилучшими пожеланиями,          Команда поддержки Garyshker.        </div>      </div>    </div>  </div></body></html>""",
                     connection=connection)


@shared_task
def send_reset_code(mail, code):
    return send_mail(subject='Восстановление пароля',
                     message=code,
                     from_email=settings.EMAIL_HOST_USER,
                     recipient_list=[mail],
                     html_message='<html><head>  <link rel="preconnect" href="https://fonts.googleapis.com">  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>  <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300;400;600;700&display=swap"    rel="stylesheet">  <style>    body {      font-family: "Source Sans Pro", sans-serif;      padding: 0px;      margin: 0px;    }    .content {      padding-top: 24px;      padding-bottom: 16px;      background-color: #0C0B15;    }    .holder {      margin: 64px auto 48px auto;      width: 50%;      min-width: 512px;      font-weight: 400;      font-size: 18px;      line-height: 28px;      color: #fff;    }    .top-image {      width: 145px;      object-fit: cover;    }    .bottom-bar {      display: flex;    }    .bottom-image {      width: 120px;      height: 120px;      object-fit: cover;    }    .bottom-bar-text {      max-width: 300px;      margin-top: 40px;      color: #fff;    }    .code-holder {      background-color: #33323E;      border-radius: 15px;      padding: 21px;      width: 100%;    }    .code-holder-text {      text-align: center;      margin: 0px auto;      font-weight: 600;      font-size: 36px;      line-height: 28px;      color: #FFA800;    }  </style></head><body>  <div class="content">    <div class="holder">      <a href="#"><img class="top-image" src="https://app.garyshker-app.kz/media/mail_message/logo.png" alt=""></a>      <h2>Привет</h2>      <p>Чтобы сменить пароль, введите этот проверочный код на платформе Garyshker:</p>      <div class="code-holder">        <div class="code-holder-text">' + str(
                         code) + '</div>      </div>      <p> Срок действия проверочных кодов истекает через 4 минут.</p>      <p>Если вы не запрашивали это изменение, проигнорируйте это сообщение, и ваш пароль остается прежним.</p>      <div class="bottom-bar">        <div><a href="#"><img class="bottom-image"              src="https://app.garyshker-app.kz/media/mail_message/sticker_love.png" alt=""></a></div>        <div class="bottom-bar-text"> С наилучшими пожеланиями,          Команда поддержки Garyshker.        </div>      </div>    </div>  </div></body></html>',
                     connection=connection)


@shared_task
def mass_mailing(*args, **kwargs):
    return send_mail(subject='Массовые сообщение',
                     message='Мы вам прислали это письмо сказать спасибо и тд',
                     from_email=settings.EMAIL_HOST_USER,
                     recipient_list=[
                         "kazbekov.bekdaulet2000@gmail.com", "bonlyoone@gmail.com"],
                     connection=connection)


@shared_task
def send_gmail_me():
    return send_mail(subject='Регистрация',
                     message='Мы вам прислали это письмо сказать спасибо и тд',
                     from_email=settings.EMAIL_HOST_USER,
                     recipient_list=["kazbekov.bekdaulet2000@gmail.com"],
                     html_message="<h1>Hello</h1>",
                     connection=connection)
