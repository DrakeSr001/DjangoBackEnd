from django.contrib import admin
from .models import Task, Persons

# Register your models here.
admin.site.register(Task),
admin.site.register(Persons),