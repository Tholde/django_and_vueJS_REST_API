# Generated by Django 5.0.6 on 2024-06-21 17:35

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Person',
            fields=[
                ('id', models.AutoField(editable=False, primary_key=True, serialize=False)),
                ('fullname', models.CharField(max_length=100)),
                ('username', models.CharField(max_length=100)),
                ('email', models.EmailField(max_length=100)),
                ('password', models.CharField(max_length=100)),
                ('contact', models.CharField(max_length=15)),
                ('address', models.CharField(max_length=100)),
                ('image', models.ImageField(blank=True, upload_to='images/')),
                ('rdoc', models.FileField(blank=True, upload_to='documents/')),
            ],
        ),
    ]
