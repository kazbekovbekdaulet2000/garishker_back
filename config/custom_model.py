from django.db import models

class AbstractModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        abstract = True

# from django.core.mail import get_connection, send_mail

# connection = get_connection(host="mail.garyshker.com", port=25, username="info@garyshker.com", password="Garyshker369$", use_tls=True) 