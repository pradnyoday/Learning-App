# Generated by Django 3.1.2 on 2020-10-17 23:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('forum', '0007_auto_20201018_0410'),
    ]

    operations = [
        migrations.AlterField(
            model_name='post',
            name='video_link',
            field=models.CharField(blank=True, default='None', max_length=5000, null=True),
        ),
    ]
