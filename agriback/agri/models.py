from django.db import models


class Person(models.Model):
    id = models.AutoField(primary_key=True, editable=False)
    fullname = models.CharField(max_length=100)
    username = models.CharField(max_length=100)
    email = models.EmailField(max_length=100)
    password = models.CharField(max_length=100)
    contact = models.CharField(max_length=15)
    address = models.CharField(max_length=100)
    image = models.ImageField(upload_to="images/", blank=True)
    rdoc = models.FileField(upload_to="documents/", blank=True)
