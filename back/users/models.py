from django.db import models


class User(models.Model):
    usercode = models.AutoField(primary_key=True)
    fullname = models.CharField(max_length=250)
    email = models.EmailField(max_length=250)
    password = models.CharField(max_length=250)
# ito ny coden'ilay objet model moa zany e
