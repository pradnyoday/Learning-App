from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.urls import reverse
# Create your models here.
import os

def saveimage(self,filename):
    return 'files/Posts/{0}/{1}_{2}'.format(self.author,self.id,filename)

class Post(models.Model):
    title = models.CharField(max_length = 500)
    content = models.TextField()
    files = models.ImageField(upload_to=saveimage, max_length=100,null=True,blank=True,default=None)
    video_link = models.CharField(max_length=5000,null=True,blank=True,default='None')
    date = models.DateTimeField(default = timezone.now)
    author = models.ForeignKey(User,on_delete = models.CASCADE)
    upvotes = models.ManyToManyField(User,related_name='upvotes',null=True,blank=True)
    classes = models.CharField(max_length=50,default='Other')
    subject = models.CharField(max_length=50,default='Other')
    
    def filetype(self):
        if(self.files == None):
            return 'None'
        name, extension = os.path.splitext(self.files.name)
        img = {'.jpg':1,'.png':1,'.jpeg':1,}
        filetype = 'other'
        if(extension in img):
            filetype = 'image'
        print(filetype)
        return filetype
    
    def  __str__(self):
        return self.title
    
    def get_absolute_url(self):
        return reverse('forum')
    
    def total_upvotes(self):
        return self.upvotes.count()
    
    class Meta:
        verbose_name_plural = 'Posts'
        db_table = 'forum_posts'

class Replies(models.Model):
    post_id = models.ForeignKey("forum.Post", on_delete=models.CASCADE,db_column = 'post_id')
    content = models.TextField()
    date = models.DateTimeField(default = timezone.now)
    author = models.ForeignKey(User,on_delete = models.CASCADE)

    def  __str__(self):
        return str(self.author)+' '+str(self.post_id_id)
    
    def get_absolute_url(self):
        return reverse('forum')
    
    class Meta:
        verbose_name_plural = 'Replies'
        db_table = 'forum_replies'
        


    
        