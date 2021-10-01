# from django.db import models
# from django.contrib.auth.models import User

# class UserProfile(models.Model):
#     REQUIRED_FIELDS = ('user', 'terms_ofuser',)
#     USERNAME_FIELD = 'email'
#     GENDER_MALE = 0
#     GENDER_FEMALE = 1
#     GENDER_CHOICES = [(GENDER_MALE, 'Male'), (GENDER_FEMALE, 'Female')]
#     user = models.OneToOneField(User, on_delete=models.CASCADE)
#     terms_ofuser = models.BooleanField(default=False)
#     images = models.FileField(upload_to='profile', blank=True, default='garysh.jpg', verbose_name=" ")
#     city = models.CharField(max_length=120, null=True, blank=True)
#     phone = models.CharField(max_length=120, null=True, blank=True)
#     age = models.IntegerField(null=True, blank=True)
#     gender = models.IntegerField(choices=GENDER_CHOICES)

#     def __str__(self):
#         return f'{self.user.username} Profile'


#     def save(self, *args, **kwargs):
#         super().save(*args, **kwargs)


import uuid
from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser


class UserManager(BaseUserManager):

    def create_user(self, email, terms_ofuser, password=None):
        
        if not email:
            raise ValueError('User must have email')

        user = self.model(
            email=self.normalize_email(email),
        )
        user.terms_ofuser=terms_ofuser
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password):

        if password is None:
            raise TypeError('Superuser user must have password')

        user = self.create_user(email, password)
        user.is_superuser = True
        user.is_staff = True
        user.save()

        return user


class User(AbstractBaseUser):

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True
        )
    terms_ofuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    
    @property
    def is_superuser(self):
        return self.is_admin

    @property
    def is_staff(self):
       return self.is_admin

    def has_perm(self, perm, obj=None):
       return self.is_admin

    def has_module_perms(self, app_label):
       return self.is_admin

    @is_staff.setter
    def is_staff(self, value):
        self._is_staff = value


    @property
    def is_superuser(self):
        return self.is_admin





    def __str__(self):
        return self.email


class Profile(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
    full_name = models.CharField(max_length=250, null=True)
    age = models.PositiveIntegerField(null=True, blank=False)
    GENDER_CHOICES = (
        ('M', 'Male'),
        ('F', 'Female'),
    )
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES)
    images = models.FileField(upload_to='profile', blank=True, default='garysh.jpg', verbose_name=" ")
    city = models.CharField(max_length=120, null=True, blank=False)
    phone = models.CharField(max_length=11, unique=True, null=True, blank=False)