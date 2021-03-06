# Generated by Django 3.1.2 on 2020-10-19 13:52

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import resources.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Resource',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=1000)),
                ('content', models.TextField()),
                ('classes', models.CharField(max_length=50)),
                ('subject', models.CharField(default='Other', max_length=50)),
                ('files', models.FileField(blank=True, default=None, null=True, upload_to=resources.models.savefile)),
                ('date', models.DateTimeField(default=django.utils.timezone.now)),
                ('video_link', models.CharField(blank=True, default='None', max_length=5000, null=True)),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name_plural': 'Resources',
                'db_table': 'resources',
            },
        ),
    ]
