# Generated by Django 4.2.7 on 2023-11-19 17:59

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("todosAPI", "0003_person"),
    ]

    operations = [
        migrations.CreateModel(
            name="Persons",
            fields=[
                ("id", models.IntegerField(primary_key=True, serialize=False)),
                ("username", models.CharField(max_length=25)),
                ("firstName", models.CharField(max_length=25)),
                ("lastName", models.CharField(max_length=25)),
                ("email", models.CharField(max_length=25)),
                ("phone", models.CharField(max_length=25)),
            ],
        ),
        migrations.DeleteModel(
            name="Person",
        ),
    ]