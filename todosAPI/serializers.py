from rest_framework import serializers
from .models import Task, Persons
class PersonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Persons
        fields = "__all__"
class TaskSerializer(serializers.ModelSerializer):
    class Meta:
        model = Task
        fields = "__all__"
