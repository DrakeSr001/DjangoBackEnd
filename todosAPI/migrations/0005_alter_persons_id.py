# Generated by Django 4.2.7 on 2023-11-20 07:16

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("todosAPI", "0004_persons_delete_person"),
    ]

    operations = [
        migrations.AlterField(
            model_name="persons",
            name="id",
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]