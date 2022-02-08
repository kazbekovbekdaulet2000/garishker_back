from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager, PermissionsMixin)
from config.custom_model import AbstractModel
from .tasks import send_gmail


class CustomUserManager(BaseUserManager):

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_active', True)
        extra_fields.setdefault('is_superuser', True)

        return self.create_user(email, password, **extra_fields)

    def create_staff(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_active', True)
        extra_fields.setdefault('is_superuser', False)
        return self.create_user(email, password, **extra_fields)

    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("Нужен email")
        if not password:
            raise ValueError("Нужен пароль")

        email = self.normalize_email(email)
        user = self.model(email=email,
                          **extra_fields)

        user.set_password(password)

        user.save()
        return user


class User(AbstractBaseUser, PermissionsMixin, AbstractModel):
    email = models.EmailField(verbose_name='email address', max_length=255, unique=True, db_index=True)
    full_name = models.CharField(max_length=255, null=True, blank=True)
    birth_date = models.DateField(max_length=8, null=True, blank=True)
    image = models.ImageField(null=True, blank=True, upload_to='profile', default='garysh.jpg', verbose_name=" ")
    city = models.CharField(max_length=255, null=True, blank=True)

    last_login = models.DateTimeField(auto_now_add=True, null=True)
    terms_ofuser = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'

    REQUIRED_FIELDS = ['full_name', 'birth_date', 'city']

    def __str__(self):
        return self.email

    def get_full_name(self):
        return ' '.join(self.name, self.surname)

    def save(self, *args, **kwargs):
        print(self.email)
        # send_gmail.delay(self.email)
        return super().save(*args, **kwargs)
