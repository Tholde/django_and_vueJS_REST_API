# Generated by Django 5.0.6 on 2024-05-15 11:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='email',
            field=models.EmailField(max_length=250),
        ),
        migrations.AlterField(
            model_name='user',
            name='usercode',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]
