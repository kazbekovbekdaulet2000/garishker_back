from rest_framework import status
from rest_framework.generics import CreateAPIView, RetrieveAPIView, UpdateAPIView
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication

from . import serializers
from . import models

class UserRegistrationView(CreateAPIView):
    serializer_class = serializers.UserRegistrationSerializer
    permission_classes = (AllowAny,)

    def post(self, request):
        payload = request.data
        if payload['terms_ofuser']=='True':
            serializer = self.serializer_class(data=payload)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            status_code = status.HTTP_201_CREATED
            response = {
                'success': 'True',
                'status code': status_code,
                'message': 'User registered  successfully',
            }

            return Response(response, status=status_code)
        else:
            return Response('Click terms of user')


class UserLoginView(RetrieveAPIView):

    permission_classes = (AllowAny,)
    serializer_class = serializers.UserLoginSerializer

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        response = {
            'success' : 'True',
            'status code' : status.HTTP_200_OK,
            'message': 'User logged in  successfully',
            'token' : serializer.data['token'],
            }
        status_code = status.HTTP_200_OK

        return Response(response, status=status_code)


class UserProfileView(RetrieveAPIView):

    def get(self, request):
        try:
            user_profile = models.Profile.objects.get(user=request.user)
            status_code = status.HTTP_200_OK
            response = {
                'success': 'true',
                'status code': status_code,
                'message': 'User profile fetched successfully',
                'data': [{
                    'email': user_profile.user.email,
                    # 'id': user_profile.user.id,
                    'full_name': user_profile.full_name,
                    'city': user_profile.city,
                    'phone_number': user_profile.phone,
                    'age': user_profile.age,
                    'gender': user_profile.gender,
                    }]
                }

        except Exception as e:
            status_code = status.HTTP_400_BAD_REQUEST
            response = {
                'success': 'false',
                'status code': status.HTTP_400_BAD_REQUEST,
                'message': 'User does not exists',
                'error': str(e)
                }
        return Response(response, status=status_code)


class UpdateProfileView(UpdateAPIView):
    def post(self, request):
        payload = request.data
        try:
            user_profile = models.Profile.objects.get(user=request.user)
            serializer = serializers.UserSerializer(instance=user_profile, data=payload)
            if serializer.is_valid():
                serializer.save()
            status_code = status.HTTP_200_OK
            response = {
                'success': 'true',
                'status code': status_code,
                'message': 'User profile fetched successfully',
                'data': [{
                    'email': user_profile.user.email,
                    'full_name': user_profile.full_name,
                    'city': user_profile.city,
                    'phone_number': user_profile.phone,
                    'age': user_profile.age,
                    'gender': user_profile.gender,
                    }]
                }

        except Exception as e:
            status_code = status.HTTP_400_BAD_REQUEST
            response = {
                'success': 'false',
                'status code': status.HTTP_400_BAD_REQUEST,
                'message': 'User does not exists',
                'error': str(e)
                }
        return Response(response, status=status_code)