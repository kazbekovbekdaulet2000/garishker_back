from django.conf.urls import url
from django.urls import path
from rest_framework_simplejwt.views import (
    TokenObtainPairView, TokenRefreshView)
from user.views import (
    UserCreateView, UserView)


urlpatterns = [
    path('login/', TokenObtainPairView.as_view()),
    path('signup/', UserCreateView.as_view()),
    path('refresh/', TokenRefreshView.as_view()),
    # path('reset-password/', EmailVerificationView.as_view()), # TODO
    path('profile/', UserView.as_view()),
]
