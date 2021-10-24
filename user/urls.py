# from django.urls import path
# from django.conf.urls import url
# from rest_framework_simplejwt.views import (
#     TokenObtainPairView,
#     TokenRefreshView,
# )
# from .views import RegisterApi

# urlpatterns = [
#     path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
#     path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
#     path('register/', RegisterApi.as_view()),
# ]


from django.conf.urls import url
from django.urls import path
from rest_framework_jwt.views import refresh_jwt_token

from .views import *


urlpatterns = [
    path('signup/', UserRegistrationView.as_view()),
    path('login/', UserLoginView.as_view()),
    path('profile/', UserProfileView.as_view()),
    path('update/', UpdateProfileView.as_view()),
    path('refresh/', refresh_jwt_token),

    ]