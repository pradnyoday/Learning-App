from django.shortcuts import render,get_object_or_404,redirect
from django.views.generic.edit import CreateView
from django.views.generic import ListView,DetailView,CreateView,UpdateView,DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin,UserPassesTestMixin
from django.views.generic.edit import FormMixin,ModelFormMixin
from .models import Post,Replies
from .forms import PostForm,CommentForm
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy,reverse

# Create your views here.


class UserPostListView(ListView):
	model = Post
	template_name = 'forum/user_posts.html'
	context_object_name = 'posts'

	def get_queryset(self):
		user = get_object_or_404(User,username=self.kwargs.get('username'))
		return Post.objects.filter(author_id=user.id).order_by('-date')

	def get_context_data(self, **kwargs):
		context = super().get_context_data(**kwargs)
		liked = False
		user = get_user(self.request)
		liked_posts = user.upvotes.filter(id__in=self.get_queryset()).values_list('id', flat=True)
		context['liked_posts'] = liked_posts
		return context
	
def get_user(request):
    return request.user

class PostListView(ListView,ModelFormMixin):
	model = Post
	template_name = 'forum/forum.html'
	context_object_name = 'posts'
	ordering = ['-date']
	form_class = PostForm
	
 
	def get(self, request, *args, **kwargs):
		self.object = None
		self.form = self.get_form(self.form_class)
		# Explicitly states what get to call:
		return ListView.get(self, request, *args, **kwargs)
    
	def post(self, request, *args, **kwargs):
		# When the form is submitted, it will enter here
		self.object = None
		self.form = self.get_form(self.form_class)

		if self.form.is_valid():
			self.form.instance.author = self.request.user
			self.object = self.form.save()
			# Here ou may consider creating a new instance of form_class(),
			# so that the form will come clean.
		# Whether the form validates or not, the view will be rendered by get()
		return redirect('forum')
    
	def get_context_data(self, **kwargs):
		context = super().get_context_data(**kwargs)
		liked = False
		user = get_user(self.request)
		liked_posts = user.upvotes.filter(id__in=self.get_queryset()).values_list('id', flat=True)
		context['liked_posts'] = liked_posts
		context['form'] = self.form
		return context
	

class PostDetailView(DetailView):
	model = Post
 
class PostCreateView(LoginRequiredMixin,CreateView):
    model = Post
    form_class  = PostForm
    
    def form_valid(self,form):
        form.instance.author = self.request.user
        
        return super().form_valid(form)
    
class PostUpdateView(LoginRequiredMixin,UserPassesTestMixin,UpdateView):
	model = Post
	form_class  = PostForm

	def form_valid(self,form):
		form.instance.author = self.request.user
		return super().form_valid(form)

	def test_func(self):
		post = self.get_object()
		if(self.request.user == post.author):
			return True
		return False

class PostDeleteView(LoginRequiredMixin,UserPassesTestMixin,DeleteView):
	model = Post
	success_url = '/forum'

	def test_func(self):
		post = self.get_object()
		if(self.request.user == post.author):
			return True
		return False

def UpvoteView(request,pk):
    post = get_object_or_404(Post,id=request.POST.get('post_id'))
    if(post.upvotes.filter(id=request.user.id).exists()):
        post.upvotes.remove(request.user)
    else:
    	post.upvotes.add(request.user)
    return HttpResponseRedirect(reverse('forum'))

def CommentView(request,pk):
    if(request.method == 'POST'):
        form = CommentForm(request.POST)
        if(form.is_valid):
            form.instance.author = request.user
            obj = form.save(commit = False)
            obj.post_id_id = pk
            obj.save()
            form = CommentForm()
    else:
        form = CommentForm()
    post = Post.objects.filter(pk = pk)
    replies = Replies.objects.filter(post_id = pk)
    no_comments = False
    if(len(replies) == 0):
        no_comments = True
    context = {'posts':post,'replies':replies,'nocomments':no_comments,'form':form}
    return render(request,'forum/comments.html',context)

