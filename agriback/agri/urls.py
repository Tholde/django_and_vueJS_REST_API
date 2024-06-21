from django.urls import path, include
from .views import *

urlpatterns = [
    path('pers/', PersonView.as_view(), name='pers'),
    path('list/', PersonView.as_view(), name='list'),
]
