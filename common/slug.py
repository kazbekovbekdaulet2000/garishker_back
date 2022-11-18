from __future__ import unicode_literals

import re
import unicodedata
import six
from django.utils.encoding import force_text
try:
    from django.utils.functional import keep_lazy as allow_lazy
except ImportError:
    from django.utils.functional import allow_lazy
from django.utils.safestring import SafeText, mark_safe


def slugify_unicode(value):
    value = force_text(value)
    value = unicodedata.normalize('NFKC', value)
    value = re.sub('[^\w\s-]', '', value, flags=re.U).strip().lower()
    return mark_safe(re.sub('[-\s]+', '-', value, flags=re.U))


slugify_unicode = allow_lazy(slugify_unicode, six.text_type, SafeText)
