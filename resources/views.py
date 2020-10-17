from django.shortcuts import render,get_object_or_404
from django.views.generic.edit import CreateView
from django.views.generic import ListView,DetailView,CreateView,UpdateView,DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin,UserPassesTestMixin
from .models import Resource
from .forms import ResourceForm
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy,reverse

# Create your views here.


class UserResourcesListView(ListView):
	model = Resource
	template_name = 'resources/user_resources.html'
	context_object_name = 'resources'

	def get_queryset(self):
		user = get_object_or_404(User,username=self.kwargs.get('username'))
		return Resource.objects.filter(author_id=user.id).order_by('-date')

	
def get_user(request):
    return request.user

class ResourcesListView(ListView):
	model = Resource
	template_name = 'resources/resources.html'
	context_object_name = 'resources'
	ordering = ['-date']

	

class ResourcesDetailView(DetailView):
	model = Resource
 
class ResourcesCreateView(LoginRequiredMixin,CreateView):
    model = Resource
    form_class  = ResourceForm
    
    def form_valid(self,form):
        form.instance.author = self.request.user
        cl = form.cleaned_data.get('classes')
        form.classes = cl
        return super().form_valid(form)
    
class ResourcesUpdateView(LoginRequiredMixin,UserPassesTestMixin,UpdateView):
	model = Resource
	form_class  = ResourceForm

	def form_valid(self,form):
		form.instance.author = self.request.user
		return super().form_valid(form)

	def test_func(self):
		post = self.get_object()
		if(self.request.user == post.author):
			return True
		return False

class ResourcesDeleteView(LoginRequiredMixin,UserPassesTestMixin,DeleteView):
	model = Resource
	success_url = '/'

	def test_func(self):
		post = self.get_object()
		if(self.request.user == post.author):
			return True
		return False