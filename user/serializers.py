from django.contrib.auth import get_user_model
from rest_framework import serializers
User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    re_password = serializers.CharField(
        style={'input_type': 'password'}, write_only=True)

    class Meta:
        model = User
        fields = ['email', 'full_name', 'birth_date',
                  'city', 'password', 're_password']
        extra_fields = {
            'password': {'write_only': True}
        }

    def validate(self, attrs):
        print(attrs)
        password = attrs['password']
        re_password = attrs['re_password']

        if password != re_password:
            raise serializers.ValidationError(
                {'password': 'Password must match'})

        return attrs

    def save(self):
        del self.validated_data['re_password']
        account = User(
            **self.validated_data
        )
        password = self.validated_data['password']
        account.set_password(password)
        account.save()


class UserInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'email', 'image', 'full_name', 'birth_date', 'city']


class UserUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['full_name', 'image', 'birth_date', 'city']
