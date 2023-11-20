from django.urls import path
from .views import GetTasks, SingleTask, AddTask, DelTask, UpdateTask, SinglePerson, AddPerson, DelPerson, UpdatePerson, GetPeople
urlpatterns = [
    # path("", GetTasks.as_view()),
    path("<int:pk>", SingleTask.as_view()),
    path('AddTask', AddTask.as_view()),
    path('DeleteTask/<int:pk>', DelTask.as_view()),
    path('UpdateTask/<int:pk>', UpdateTask.as_view()),
    #Persons
    path("people", GetPeople.as_view()),
    path("PersonDetails/<int:pk>", SinglePerson.as_view()),
    path('AddPerson', AddPerson.as_view()),
    path('DeletePerson/<int:pk>', DelPerson.as_view()),
    path('UpdatePerson/<int:pk>', UpdatePerson.as_view()),
]