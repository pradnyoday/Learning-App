from django import forms
from .models import Post,Replies,Assessment,Questions
classes = [('Other','Other'),
           ('1','I'),
            ('2','II'),
            ('3','III'),
            ('4','IV'),
            ('5','V'),
            ('6','VI'),
            ('7','VII'),
            ('8','VIII'),
            ('9','IX'),
            ('10','X'),
            ('11','XI'),
            ('12','XII'),
        ]

subject = [('Other','Other'),
           ('Science','Science'),
           ('History','History'),
            ('Civics','Civics'),
            ('Geography','Geography'),
            ('Mathematics','Mathematics'),
            ('English','English'),
            ('Marathi','Marathi'),
            ('Hindi','Hindi'),
            ('Physics','Physics'),
            ('Chemistry','Chemistry'),
            ('Electronics','Electronics'),
            ('Computer Science','Computer Science'),
            ('Information Technology','Information Technology'),
        ]

class PostForm(forms.ModelForm):
    title = forms.CharField(max_length=500,label='',widget=forms.TextInput(attrs={'placeholder': 'Title','class':'form-control'}))
    content = forms.CharField(max_length=2000,label='',widget=forms.Textarea(attrs={'placeholder': 'Whats On Your mind?',}))
    files1 = forms.ImageField(required=False,label='Upload a File')
    video_link = forms.CharField(required=False,max_length=5000,label='',widget=forms.TextInput(attrs={'placeholder': 'Video Link (if any)','class':'form-control'}))
    classes = forms.ChoiceField(choices=classes,label='Class',widget=forms.Select(attrs={'class':'form-control'}))
    subject = forms.ChoiceField(choices=subject,label='Subject',widget=forms.Select(attrs={'class':'form-control'}))
    class Meta:
        model = Post
        fields = ['title','content','files1','video_link']
        
class CommentForm(forms.ModelForm):
    content = forms.CharField(max_length=2000,label='',widget=forms.TextInput(attrs={'placeholder': 'Start Typing Here...'}))
    class Meta:
        model = Replies
        fields = ['content']
<<<<<<< HEAD

class AssessmentForm(forms.ModelForm):

    class Meta:
        model = Assessment
        fields = ['name', 'standard', 'subject', 'topic']

class QuestionForm(forms.ModelForm):

    class Meta:
        model = Questions
        fields = ['question', 'option1', 'option2', 'option3', 'option4', 'answer', 'marks']
=======
        
class SortByForm(forms.Form):
    classes = forms.ChoiceField(required=False,initial='Other',choices=classes,label='Class',widget=forms.Select(attrs={'style':'width:30%;font-size=40px;'}))
>>>>>>> origin/master
