from django.contrib.auth.hashers import make_password
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response

from crud import models, serializers


# ito ny controlleur raha laravel no resaka
class UserView(APIView):
    # ito ny code manao affichage
    def get(self, request, id=None):
        try:
            if id:
                item = models.User.objects.get(pk=id)
                serializer = serializers.UserSerializer(item)
                return Response(serializer.data, status=status.HTTP_200_OK)
            items = models.User.objects.all().order_by('usercode')
            serializer = serializers.UserSerializer(items, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except models.User.DoesNotExist:
            return Response(dict(status=f'user {id} not found'), status=status.HTTP_404_NOT_FOUND)

    # ito ny code manao ajout
    def post(self, request):
        user = request.data
        if len(user['password']) > 6:
            users = {
                'fullname': user['fullname'],
                'email': user['email'],
                'password': make_password(user['password']),
            }
            serializer = serializers.UserSerializer(data=users)
            if serializer.is_valid():
                serializer.save()
                return Response(dict(status=f'{users.get('fullname')} information saved successfully'),
                                status=status.HTTP_201_CREATED)
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response(dict(status='Your password must be at least 6 characters long'),
                            status=status.HTTP_400_BAD_REQUEST)

    # ito ny code manao update
    def put(self, request, id=None):
        try:
            item = models.User.objects.get(pk=id)
            user = request.data
            if len(user['password']) > 6:
                users = {
                    'fullname': user['fullname'],
                    'email': user['email'],
                    'password': make_password(user['password']),
                }
                serializer = serializers.UserSerializer(data=users)
                serializer = serializers.UserSerializer(item, data=users, partial=True)
                if serializer.is_valid():
                    serializer.save()
                    return Response(dict(status=f'user {id} updated successfully'), status=status.HTTP_200_OK)
                else:
                    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response(dict(status='Your password must be at least 6 characters long'),
                                status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            return Response(dict(status=f'user not found'), status=status.HTTP_404_NOT_FOUND)

    # ito ny code mamafa
    def delete(self, request, id=None):
        try:
            item = models.User.objects.get(pk=id)
            item.delete()
            return Response(dict(status=f'user {id} deleted successfully'), status=status.HTTP_204_NO_CONTENT)
        except Exception as e:
            return Response(dict(status=f'user not found'), status=status.HTTP_404_NOT_FOUND)