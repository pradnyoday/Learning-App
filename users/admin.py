from django.contrib import admin

# Register your models here.
from .models import Profile,Student,Teacher,Parent
# Register your models here.
admin.site.register(Profile)
admin.site.register(Student)
admin.site.register(Teacher)
admin.site.register(Parent)