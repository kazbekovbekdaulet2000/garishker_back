from django.contrib.auth import authenticate
from django.contrib.auth.models import update_last_login
from rest_framework import serializers
from rest_framework_jwt.settings import api_settings
from rest_framework.response import Response

from . import models


class UserSerializer(serializers.ModelSerializer):
    full_name = serializers.CharField(max_length=250, required=False)
    age = serializers.CharField(required=False)
    gender = serializers.CharField(max_length=1, required=False)
    city = serializers.CharField(max_length=120, required=False)
    phone = serializers.CharField(max_length=11, required=False)

    class Meta:
        model = models.Profile
        fields = ('full_name', 'age', 'gender', 'city', 'phone')


class UserRegistrationSerializer(serializers.ModelSerializer):

    profile = UserSerializer(required=False)

    class Meta:
        model = models.User
        fields = ('email', 'password', 'profile')
        extra_kwargs = {'password': {'write_only': True}}


    def create(self, validated_data):
        profile_data = validated_data.pop('profile')
        user = models.User.objects.create_user(**validated_data)
        models.Profile.objects.create(
            user=user,
            full_name=profile_data['full_name'],
            age=profile_data['age'],
            gender=profile_data['gender'],
            city=profile_data['city'],
            phone=profile_data['phone']
        )
        return user
    # def create(self, validated_data):
    #     profile_data = validated_data.pop('profile')
    #     print(validated_data)
    #     if validated_data['terms_ofuser']==True:
    #         user = models.User.objects.create_user(**validated_data)
    #         models.Profile.objects.create(
    #             user=user,
    #             full_name=profile_data['full_name'],
    #             age=profile_data['age'],
    #             gender=profile_data['gender'],
    #             city=profile_data['city'],
    #             phone=profile_data['phone']
    #         )
    #         return user
    #     else:
    #         return Response('click')
    



JWT_PAYLOAD_HANDLER = api_settings.JWT_PAYLOAD_HANDLER
JWT_ENCODE_HANDLER = api_settings.JWT_ENCODE_HANDLER

class UserLoginSerializer(serializers.Serializer):

    email = serializers.CharField(max_length=255)
    password = serializers.CharField(max_length=128, write_only=True)
    token = serializers.CharField(max_length=255, read_only=True)

    def validate(self, data):
        email = data.get("email", None)
        password = data.get("password", None)
        user = authenticate(email=email, password=password)
        if user is None:
            raise serializers.ValidationError(
                'A user with this email and password is not found.'
            )
        try:
            payload = JWT_PAYLOAD_HANDLER(user)
            jwt_token = JWT_ENCODE_HANDLER(payload)
            update_last_login(None, user)
        except models.User.DoesNotExist:
            raise serializers.ValidationError(
                'User with given email and password does not exists'
            )
        return {
            'email':user.email,
            'token': jwt_token
        }