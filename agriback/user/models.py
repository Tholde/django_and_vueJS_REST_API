from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    fullname = models.CharField(max_length=250)
    email = models.EmailField(max_length=250, unique=True)
    password = models.CharField(max_length=250)
    contact = models.CharField(max_length=15)
    fonction = models.CharField(max_length=250)
    username = None

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []
