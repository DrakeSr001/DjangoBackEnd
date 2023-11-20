from .serializers import TaskSerializer, PersonSerializer
from django.shortcuts import render
from rest_framework import generics
from .models import Task, Persons
# Create your views here.

class GetTasks(generics.ListAPIView):
    queryset = Task.objects.all()
    serializer_class = TaskSerializer
    
    
#CRUD Operations
    
class SingleTask(generics.RetrieveAPIView): # Read Task
    queryset = Task.objects.all()    
    serializer_class = TaskSerializer

class AddTask(generics.CreateAPIView):  #Add Task
    serializer_class = TaskSerializer
    
class DelTask(generics.DestroyAPIView):  #Delete Task
    queryset = Task.objects.all()
    serializer_class = TaskSerializer
    
class UpdateTask(generics.RetrieveUpdateAPIView):  #Update Task
    queryset = Task.objects.all()    
    serializer_class = TaskSerializer
    
#Persons
class GetPeople(generics.ListAPIView):
    queryset = Persons.objects.all()
    serializer_class = PersonSerializer
    
class SinglePerson(generics.RetrieveAPIView): # Read Task
    queryset = Persons.objects.all()    
    serializer_class = PersonSerializer

class AddPerson(generics.CreateAPIView):  #Add Task
    serializer_class = PersonSerializer
    
class DelPerson(generics.DestroyAPIView):  #Delete Task
    queryset = Persons.objects.all()
    serializer_class = PersonSerializer
    
class UpdatePerson(generics.RetrieveUpdateAPIView):  #Update Task
    queryset = Persons.objects.all()    
    serializer_class = PersonSerializer


