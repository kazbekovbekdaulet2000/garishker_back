from datetime import date

PROJECT_TYPE = (
    ('reqular', 'Обычный'),
    ('special', 'Спецпроекты')
)

YEAR_CHOICES = [(y, y) for y in range(2018, date.today().year+1)]

PROJECT_STATUS = (
    ('in_process', 'В процессе'),
    ('on_pause', 'В паузе'),
    ('finished', 'Завершен')
)
