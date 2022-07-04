# class Customer(AbstractModel):
#     user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='card', on_delete=models.CASCADE, null=False)
#     customer_id = models.CharField(max_length=255)
#     email = models.CharField(max_length=255)
#     phone = models.CharField(max_length=255)

#     @classmethod
#     def createCustomer(cls, amount: int, capture_method="AUTO"):
#         url = f"{settings.PAYMENT_URL}v2/orders"
#         payload = json.dumps({
#             "amount": amount,
#             "capture_method": capture_method,
#             "back_url": "https://garyshker-dev.web.app/"
#         })
#         headers = {
#             'API-KEY': settings.PAYMENT_API_KEY,
#             'Content-Type': 'application/json'
#         }
#         response = requests.request("POST", url, headers=headers, data=payload)
#         return response.json()