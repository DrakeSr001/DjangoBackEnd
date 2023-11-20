from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Persons(models.Model):
    id = models.AutoField(primary_key=True, null=False)
    username = models.CharField(max_length=25)
    firstName = models.CharField(max_length=25)
    lastName = models.CharField(max_length=25)
    email = models.CharField(max_length=25)
    phone = models.CharField(max_length=25)
    def __str__(self):
        return str(self.id)
    
    
class Task(models.Model):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=100)
    isCompleted = models.BooleanField(default=False)
    createdAt = models.DateTimeField(auto_now_add=True)
    updatedAt = models.DateTimeField(auto_now=True)
    owner = models.ForeignKey(User, on_delete=models.CASCADE)
    
