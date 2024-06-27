from rest_framework import serializers
from agri.models import Person


class PersonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = ['id','fullname', 'username', 'email', 'password', 'contact', 'address', 'image', 'rdoc']