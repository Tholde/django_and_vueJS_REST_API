from django.db import models


class User(models.Model):
    id = models.AutoField(primary_key=True)
    fullname = models.CharField(max_length=250)
    username = models.CharField(max_length=250)
    email = models.EmailField(max_length=250)
    password = models.CharField(max_length=250)
    contact = models.CharField(max_length=15)
    lieuPoste = models.CharField(max_length=250)