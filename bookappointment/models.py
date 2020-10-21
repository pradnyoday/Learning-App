from django.db import models
from datetime import datetime
# Create your models here.

class Appointments(models.Model):
    date = models.DateTimeField()
    teacher = models.ForeignKey("users.Teacher",on_delete=models.CASCADE)
    parent = models.ForeignKey("users.Parent",on_delete=models.CASCADE)
    issue = models.CharField(max_length=500,default='None')
    status = models.CharField(default='pending', max_length=50)
    class Meta:
        verbose_name_plural = 'Appointments'

    def __str__(self):
        return str(self.teacher.user.username)+' '+str(self.parent.user.username)+' on '+str(self.date)
