# Generated by Django 3.2.6 on 2021-09-26 13:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('WeddingApp', '0013_remove_weddinghall_capacity'),
    ]

    operations = [
        migrations.AddField(
            model_name='wedding',
            name='description',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='action',
            name='type',
            field=models.PositiveSmallIntegerField(choices=[(0, 'like'), (1, 'haha'), (2, 'heart')], default=1),
        ),
    ]
