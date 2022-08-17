import os
import sys
from django.utils.translation import gettext_lazy as _
from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser, 
    BaseUserManager, 
    PermissionsMixin
)
from common.contants import USER_TYPE
from common.custom_model import AbstractModel
from obrazovanie.models.common_manager import ReactionManager
from PIL import Image
from django.core.files.uploadedfile import InMemoryUploadedFile
from io import BytesIO


class CustomUserManager(BaseUserManager, ReactionManager):

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
    name = models.CharField(max_length=255, null=True, blank=True)
    surname = models.CharField(max_length=255, null=True, blank=True)
    birth_date = models.DateField(max_length=8, null=True, blank=True)
    image = models.ImageField(null=True, blank=True, upload_to='profile', default='garysh.jpg', verbose_name="Фото")
    country = models.CharField(max_length=255, null=True, blank=True, default=None)
    city = models.CharField(max_length=255, null=True, blank=True, default=None)
    description = models.TextField(null=True, blank=True)
    user_type = models.PositiveIntegerField(choices=USER_TYPE, default=0)
    edu_place = models.CharField(null=True, max_length=255)
    last_login = models.DateTimeField(auto_now_add=True, null=True)
    verified = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['name', 'surname', 'birth_date', 'city', 'user_type']

    def __str__(self):
        return self.email

    def get_full_name(self):
        return f'{self.name} {self.surname}'
    
    def create_thumbnail(self, newsize) -> InMemoryUploadedFile:
        data_img = BytesIO()
        img = Image.open(self.image)
        img = img.convert('RGB')
        THUMBNAIL_SIZE = (newsize, newsize)
        img.thumbnail(THUMBNAIL_SIZE, Image.ANTIALIAS)
        img.save(data_img, format='jpeg', quality=100)

        return InMemoryUploadedFile(data_img, 'ImageField', '%s.%s' % (os.path.splitext(self.image.name)[0], 'jpeg'), 'jpeg', sys.getsizeof(data_img), None)
       
    def save(self, *args, **kwargs):
        self.image = self.create_thumbnail(480)
        force_update = False
        if self.id:
            force_update = True
        super(User, self).save(force_update=force_update, *args, **kwargs)