from django import forms
from .models import Resource

classes = [('1','I'),
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
            ('Other','Other'),
        ]

subject = [('History','History'),
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
            ('Other','Other'),
        ]


class ResourceForm(forms.ModelForm):
    classes = forms.ChoiceField(choices=classes)
    subject = forms.ChoiceField(choices=subject)
    title = forms.CharField(max_length=500,label='',widget=forms.TextInput(attrs={'placeholder': 'Title'}))
    content = forms.CharField(max_length=2000,label='',widget=forms.TextInput(attrs={'placeholder': 'Whats On Your mind?'}))
    files1 = forms.FileField(required=False,label='Upload a File')
    class Meta:
        model = Resource
        fields = ['title','content','files1','classes','subject']
        