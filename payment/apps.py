from django.apps import AppConfig


class SupportpaymentConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'payment'
    verbose_name = 'Платежи'
    verbose_name_plural = 'Платежи'