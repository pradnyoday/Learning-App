from django.shortcuts import render,redirect
from django.contrib import messages
from .forms import UserRegisterForm,UserUpdateForm,ProfileUpdateForm,StudentForm,ParentForm,TeacherForm
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
def register(request):
    if(request.method == 'POST'):
        form = UserRegisterForm(request.POST)
        if(form.is_valid()):
            obj = form.save()
            username = form.cleaned_data.get('username')
            role = form.cleaned_data.get('role')
            user = obj.id
            context = {'role':role,'user':user}
            request.session['context'] = context
            return redirect('setvals')
            
    else:
        form = UserRegisterForm()
    return render(request,'users/register.html',{'form':form})

@login_required
def profile(request):
    if(request.method == 'POST'):
        u_form = UserUpdateForm(request.POST,instance=request.user)
        p_form = ProfileUpdateForm(request.POST,
                                    request.FILES,
                                    instance=request.user.profile)
        if(u_form.is_valid() and p_form.is_valid()):
            u_form.save()
            p_form.save()
            messages.success(request, f'Profile Updated Successfully!!')
            return redirect('profile')

    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = ProfileUpdateForm(instance=request.user.profile)
    context = {
        'u_form' : u_form,
        'p_form' : p_form
    }
    return render(request,'users/profile.html',context)

def setformvalues(request):
    context = request.session['context']
    role = context['role']
    user = context['user']
    print(role,user)
    if(request.method == 'POST'):
        if(role == '0'):
            form = StudentForm(request.POST)
        elif(role == '1'):
            form = ParentForm(request.POST)
        else:
            form = TeacherForm(request.POST)
        if(form.is_valid()):
            obj = form.save(commit=False)
            obj.user_id = int(user)
            if(role == '2'):
                s = form.cleaned_data.get('classes')
                print(s)
                if('1' in s):obj.is_class1 = 1
                else:obj.is_class1 = 0
                if('2' in s):obj.is_class2 = 1
                else:obj.is_class1 = 0
                if('3' in s):obj.is_class3 = 1
                else:obj.is_class1 = 0
                if('4' in s):obj.is_class4 = 1
                else:obj.is_class1 = 0
                if('5' in s):obj.is_class5 = 1
                else:obj.is_class1 = 0
                if('6' in s):obj.is_class6 = 1
                else:obj.is_class1 = 0
                if('7' in s):obj.is_class7 = 1
                else:obj.is_class1 = 0
                if('8' in s):obj.is_class8 = 1
                else:obj.is_class1 = 0
                if('9' in s):obj.is_class9 = 1
                else:obj.is_class1 = 0
                if('10' in s):obj.is_class10 = 1
                else:obj.is_class1 = 0
                if('11' in s):obj.is_class11 = 1
                else:obj.is_class1 = 0
                if('12' in s):obj.is_class12 = 1
                else:obj.is_class1 = 0
            obj.save()
            return redirect('login')
    else:
        if(role == '0'):
            form = StudentForm()
        elif(role == '1'):
            form = ParentForm()
        else:
            form = TeacherForm()
    return render(request,'users/roleform.html',{'form':form})