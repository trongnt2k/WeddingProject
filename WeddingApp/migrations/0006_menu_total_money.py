# Generated by Django 3.2.6 on 2021-09-14 16:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('WeddingApp', '0005_remove_menu_total_money'),
    ]

    operations = [
        migrations.AddField(
            model_name='menu',
            name='total_money',
            field=models.BigIntegerField(null=True),
        ),
    ]
