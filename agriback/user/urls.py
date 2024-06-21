from django.urls import path
from user.views import *

urlpatterns = [
    path('register', RegisterView.as_view()),
    path('login', LoginView.as_view()),
    # path('user', UserView.as_view()),
    path('user/<int:id>', UserView.as_view()),
    # path('user/<str:token>', UserView.as_view()),
    path('logout', LogoutView.as_view()),
]
