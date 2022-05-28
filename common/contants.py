from django.utils.translation import gettext_lazy as _

LANGS = ['ru','kk']

USER_TYPE = (
    (0, _('Школьник')),
    (1, _('Студент')),
    (2, _('Работаю')),
    (3, _('Другое')),
)

VIDEO_CONVERSION_STATUS_CHOICES = (
    ('pending', _('Требуется конвертация')),
    ('started', _('Конвертируется')),
    ('converted', _('Конвертирован')),
    ('error', _('Ошибка')),
)

DELIVERY_CHOICES = (
    (0, _('Доставка по городу Алматы')),
    (1, _('Самовывоз (г. Алматы)')),
    (2, _('Доставка по Казахстану'))
)