from django.shortcuts import render,redirect
from .forms import AppointmentsForm
from django.contrib.auth.decorators import login_required
from .models import Appointments
from users.models import Teacher,Parent
from django.contrib import messages
# Create your views here.
@login_required
def bookappointment(request):
    if(request.method == 'POST'):
        form = AppointmentsForm(request.POST, instance=request.user)
        if(form.is_valid()):
            print('hi')
            form.save()
            messages.success(request, f'Appointment Booked Succesfully!')
            return redirect('forum')

    else:
        form = AppointmentsForm(instance=request.user)
    context = {'form' : form}
    return render(request,'bookappointment/bookappointment.html',context)

@login_required
def approve(request):
    print(request.user.profile.role)
    if(request.user.is_authenticated and request.user.profile.role == 2):
        u = Teacher.objects.filter(user = request.user)[0]
        cont = Appointments.objects.filter(teacher = u,status='pending')
        appointments = cont
        count = cont
        count = len(count)
        print(appointments,count)
        context = {'appointments':appointments,'count':count}
        return render(request,'bookappointment/approve.html',context)
    else:
        return redirect('forum')
    
@login_required
def updatestatus(request,pk,status):
    print(request.user.profile.role)
    if(request.user.is_authenticated and request.user.profile.role == 2):
        app = Appointments.objects.filter(pk=pk)
        if(status == 1):
            app.status = app.update(status='approved')
        elif(status == -1):
            app.status = app.update(status='cancelled')
        return redirect('approve')
    else:
        return redirect('forum')