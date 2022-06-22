from django.utils.translation import gettext_lazy as _

LANGS = ['ru', 'kk']

USER_TYPE = (
    (0, _('Школьник')),
    (1, _('Студент')),
    (2, _('Работаю')),
    (3, _('Другое')),
)

VIDEO_CONVERSION_STATUS_CHOICES = (
    ('pending', _('Требуется конвертация')),
    ('downloading', _('Идет загрузка')),
    ('started', _('Конвертируется')),
    ('converted', _('Конвертирован')),
    ('link', _('Ссылка')),
    ('error', _('Ошибка')),
)

DELIVERY_CHOICES = (
    (0, _('Доставка по городу Алматы')),
    (1, _('Самовывоз (г. Алматы)')),
    (2, _('Доставка по Казахстану'))
)

# NEED MODIFICATION IN DA FUTURE
VIDEO_URL_TYPE = (
    (0, 'html'),
    (1, 'youtube'),
    (2, 'vimeo'),
    (3, 's3'),
    (4, 'other')
)

# (x,y) = {y}p
VIDEO_QUALITIES = (
    (640, 360),
    (854, 480),
    (1280, 720),
    (1920, 1080)
)
