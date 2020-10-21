from django import forms
from .models import Appointments
from users.models import Teacher


class DateInput(forms.DateInput):
    input_type = 'datetime-local'
    
class AppointmentsForm(forms.ModelForm):
    teacher = forms.ChoiceField(choices=[(i.user.first_name,i.user.first_name) for i in Teacher.objects.all()])
    issue = forms.CharField(max_length=500)
    class Meta:
        model = Appointments
        fields = ('teacher','date','issue')
        widgets = {
            'date': DateInput(),
        }