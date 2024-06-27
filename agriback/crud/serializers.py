from rest_framework import serializers

from crud.models import User


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('usercode','fullname','email','password')