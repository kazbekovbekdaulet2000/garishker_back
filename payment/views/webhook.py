import datetime as dt
import json
from secrets import compare_digest

from django.conf import settings
from django.db.transaction import atomic, non_atomic_requests
from django.http import HttpResponse, HttpResponseForbidden
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from django.utils import timezone

from payment.models.webhook_event import WebhookEvent

@csrf_exempt
@require_POST
@non_atomic_requests
def acme_webhook(request):
    given_token = request.headers.get("Acme-Webhook-Token", "")
    if not compare_digest(given_token, settings.ACME_WEBHOOK_TOKEN):
        return HttpResponseForbidden(
            "Incorrect token in Acme-Webhook-Token header.",
            content_type="text/plain",
        )
    payload = json.loads(request.body)
    process_webhook_payload(payload)
    return HttpResponse("Message received okay.", content_type="text/plain")

def process_webhook_payload(payload):
    print("--------->", payload)
    WebhookEvent.objects.create(payload=payload)
    