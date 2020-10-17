from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Profile,Student,Parent,Teacher
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
roles = [(0,'Student'),(1,'Parent'),(2,'Teacher')]
class UserRegisterForm(UserCreationForm):
	username = forms.CharField(max_length=50, label='',widget=forms.TextInput(attrs={'placeholder': 'Username'}))
	email = forms.EmailField(label='',widget=forms.TextInput(attrs={'placeholder': 'Email'}))
	role = forms.ChoiceField(choices=roles)
	first_name = forms.CharField(max_length=50,label='',widget=forms.TextInput(attrs={'placeholder': 'First Name'}))
	last_name = forms.CharField(max_length=50,label='',widget=forms.TextInput(attrs={'placeholder': 'Last Name'}))
	password1 = forms.CharField(max_length=100,label='',widget=forms.PasswordInput(attrs={'placeholder': 'Password'}))
	password2 = forms.CharField(max_length=100,label='',widget=forms.PasswordInput(attrs={'placeholder': 'Confirm Password'}))
	class Meta:
		model = User
		fields = ['username','email','first_name','last_name','password1','password2']

class UserUpdateForm(forms.ModelForm):
	email = forms.EmailField(label='',widget=forms.TextInput(attrs={'placeholder': 'Email'}))
	first_name = forms.CharField(max_length=50,label='',widget=forms.TextInput(attrs={'placeholder': 'First Name'}))
	last_name = forms.CharField(max_length=50,label='',widget=forms.TextInput(attrs={'placeholder': 'Last Name'}))
	password1 = forms.CharField(max_length=100,label='',widget=forms.PasswordInput(attrs={'placeholder': 'Password'}))
	password2 = forms.CharField(max_length=100,label='',widget=forms.PasswordInput(attrs={'placeholder': 'Confirm Password'}))
	class Meta:
		model = User
		fields = ['username','email','first_name','last_name','password1','password2']

class ProfileUpdateForm(forms.ModelForm):
	class Meta:
		model = Profile
		fields = ['image']
  
class StudentForm(forms.ModelForm):
	rollno = forms.IntegerField()
	standard = forms.ChoiceField(choices=classes, required=False)
	class Meta:
		model = Student
		fields = ('rollno','standard')
  
class ParentForm(forms.ModelForm):
	child = forms.CharField( max_length=100, )
	class Meta:
		model = Parent
		fields = ('child',)

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
        ]

class TeacherForm(forms.ModelForm):
	education = forms.CharField(max_length=200)
	classes = forms.MultipleChoiceField(label='Classes :',widget=forms.CheckboxSelectMultiple,choices=(classes))
	class Meta:
		model = Teacher
		fields = ('education','classes')