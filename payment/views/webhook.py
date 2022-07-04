import json
from django.db.transaction import atomic, non_atomic_requests
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from payment.ioka.schema import WebhookResponse
from payment.models.donation import UserDonation

@csrf_exempt
@require_POST
@non_atomic_requests
def acme_webhook(request):
    payload = json.loads(request.body)
    process_webhook_payload(payload)
    return HttpResponse("Message received okay.", content_type="text/plain")


@atomic
def process_webhook_payload(payload):
    response = WebhookResponse(**payload)
    donation = UserDonation.objects.filter(order_id=response.order.id).last()
    donation.status = 1
    donation.amount_clear = response.payment.approved_amount-response.payment.processing_fee
    donation.save()