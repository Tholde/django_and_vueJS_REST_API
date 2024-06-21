from django.shortcuts import render
from rest_framework import status, permissions
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.response import Response
from rest_framework.views import APIView

from agriback import settings
from user import serializers
from user.models import User
from user.serializers import UserSerializer
import jwt, datetime


class RegisterView(APIView):
    def post(self, request):
        user = request.data
        print(
            f"Email: {user['email']}\nPassword: {user['password']}\nFullname: {user['fullname']}\nRole: {user['role']}"
            f"\nContact: {user['contact']}\nAddress: {user['address']}\nImage: {user['image']}\nCV: {user['cv']}\n"
            f"Creation: {user['created_at']}\nUpadate: {user['updated_at']}\n")
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)


class LoginView(APIView):
    def post(self, request):
        email = request.data['email']
        password = request.data['password']
        user = User.objects.filter(email=email).first()
        if user is None:
            raise AuthenticationFailed('User not found')
        if not user.check_password(password):
            raise AuthenticationFailed('Incorrect password')
        payload = {
            'id': user.id,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=60),
            'iat': datetime.datetime.utcnow(),
        }
        token = jwt.encode(payload, 'secret', algorithm='HS256').decode('utf-8')
        response = Response()
        response.set_cookie(key='jwt', value=token, httponly=True)
        response.data = {
            "jwt": token
        }
        return response


class UserView(APIView):
    # permission_classes = [permissions.IsAuthenticated]
    # def get(self, request, token=None):
    #     token = request.COOKIES.get('jwt')
    #     # token = request.data
    #     if token is None:
    #         raise AuthenticationFailed('Unauthenticated')
    #     try:
    #         payload = jwt.decode(token, 'secret', algorithms=['HS256'])
    #     except jwt.ExpiredSignatureError:
    #         raise AuthenticationFailed('Unauthenticated')
    #     user = User.objects.filter(id=payload['id']).first()
    #     serializer = UserSerializer(user)
    #     return Response(serializer.data)
    def get(self, request, id=None):
        try:
            if id:
                item = User.objects.get(pk=id)
                serializer = serializers.UserSerializer(item)
                return Response(serializer.data, status=status.HTTP_200_OK)
            items = User.objects.all().order_by('id')
            serializer = serializers.UserSerializer(items, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            return Response(dict(status=f'user {id} not found'), status=status.HTTP_404_NOT_FOUND)



class LogoutView(APIView):
    def post(self, request):
        response = Response()
        response.delete_cookie('jwt')
        response.data = {
            'message': 'You have been logged out.'
        }
        return response