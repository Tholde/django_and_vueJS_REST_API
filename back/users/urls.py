from django.urls import path, include
from .views import *

urlpatterns = [
    path('users/', UserView.as_view()),
    path('users/<int:id>', UserView.as_view())
]

# ito no maka azy avy any amin'ny views na controlleur izy @ php
