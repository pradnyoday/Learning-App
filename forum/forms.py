from django import forms
from .models import Post,Replies

class PostForm(forms.ModelForm):
    title = forms.CharField(max_length=500,label='',widget=forms.TextInput(attrs={'placeholder': 'Title','class':'form-control'}))
    content = forms.CharField(max_length=2000,label='',widget=forms.Textarea(attrs={'placeholder': 'Whats On Your mind?',}))
    files1 = forms.ImageField(required=False,label='Upload a File')
    class Meta:
        model = Post
        fields = ['title','content','files1']
        
class CommentForm(forms.ModelForm):
    content = forms.CharField(max_length=2000,label='',widget=forms.TextInput(attrs={'placeholder': 'Start Typing Here...'}))
    class Meta:
        model = Replies
        fields = ['content']