from django.contrib import admin
from .models import Post,Replies,Attendance,Questions,Assessment,Marks
# Register your models here.
admin.site.register(Post)
admin.site.register(Replies)
admin.site.register(Attendance)
admin.site.register(Questions)
admin.site.register(Assessment)
admin.site.register(Marks)