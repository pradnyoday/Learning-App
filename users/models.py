from django.db import models
from django.contrib.auth.models import User
from PIL import Image

def saveimage(self,filename):
    return 'profile_pics/{0}/{1}'.format(self.user,filename)

class Profile(models.Model):
    user = models.OneToOneField(User,on_delete = models.CASCADE,null=True,blank=True)
    image = models.ImageField(default='profile_pics/default.jpg',upload_to=saveimage,null=True,blank=True)
    role = models.IntegerField(default=404,null=True,blank=True)
    
    def __str__(self):
        return f'{self.user.username} Profile'

    def save(self, force_insert=False, force_update=False, using=None):
        super().save()
        img = Image.open(self.image.path)

        if(img.height > 300 or img.width > 300):
            output_size = (300,300)
            img.thumbnail(output_size)
            img.save(self.image.path)

class Student(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    rollno = models.IntegerField()
    standard = models.CharField(max_length=50)
    
    def __str__(self):
        return self.user.username

class Teacher(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    education = models.CharField(max_length=50,default='None')
    is_class1 = models.IntegerField(default=0)
    is_class2 = models.IntegerField(default=0)
    is_class3 = models.IntegerField(default=0)
    is_class4 = models.IntegerField(default=0)
    is_class5 = models.IntegerField(default=0)
    is_class6 = models.IntegerField(default=0)
    is_class7 = models.IntegerField(default=0)
    is_class8 = models.IntegerField(default=0)
    is_class9 = models.IntegerField(default=0)
    is_class10 = models.IntegerField(default=0)
    is_class11 = models.IntegerField(default=0)
    is_class12 = models.IntegerField(default=0)
    
    def __str__(self):
        return self.user.username

class Parent(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE)
    child = models.ForeignKey(Student, on_delete=models.CASCADE)
    contact_info = models.CharField(max_length=20)
    address = models.CharField(max_length=200)
    city = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    
    def __str__(self):
        return self.user.username