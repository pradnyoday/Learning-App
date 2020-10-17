from django import forms
from .models import Resource

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


class ResourceForm(forms.ModelForm):
    classes = forms.ChoiceField(choices=classes,label='Class',widget=forms.Select(attrs={'class':'form-control'}))
    subject = forms.ChoiceField(choices=subject,label='Subject',widget=forms.Select(attrs={'class':'form-control'}))
    title = forms.CharField(max_length=500,label='',widget=forms.TextInput(attrs={'placeholder': 'Title','class':'form-control'}))
    content = forms.CharField(max_length=2000,label='',widget=forms.Textarea(attrs={'placeholder': 'Whats On Your mind?','style':'height:100px;'}))
    files1 = forms.FileField(required=False,label='Upload a File')
    video_link = forms.CharField(required=False,max_length=5000,label='',widget=forms.TextInput(attrs={'placeholder': 'Video Link (if any)','class':'form-control'}))
    class Meta:
        model = Resource
        fields = ['title','content','files1','classes','subject','video_link']
        