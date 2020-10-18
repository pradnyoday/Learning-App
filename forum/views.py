from django.shortcuts import render,get_object_or_404,redirect
from django.views.generic.edit import CreateView
from django.views.generic import ListView,DetailView,CreateView,UpdateView,DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin,UserPassesTestMixin
from django.views.generic.edit import FormMixin,ModelFormMixin
from .models import Post,Replies
from .forms import PostForm,CommentForm,SortByForm
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy,reverse
from django.contrib.auth.decorators import login_required
# Create your views here.


class UserPostListView(LoginRequiredMixin,ListView):
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

class PostListView(LoginRequiredMixin,ListView,ModelFormMixin):
	model = Post
	template_name = 'forum/forum.html'
	context_object_name = 'posts'
	ordering = ['-date']
	form_class = PostForm
 
	def get_queryset(self):
		if(self.request.method == 'GET'):
			search_form = SortByForm(self.request.GET)
			if search_form.is_valid():
				print('search_form')
				classes = search_form.cleaned_data.get('classes')
				print(classes)
				queryset = Post.objects.filter(classes = classes)
		return queryset
    
	def get(self, request, *args, **kwargs):
		self.object = None
		self.form =  self.form_class()
		return ListView.get(self, request, *args, **kwargs)
    
	def post(self, request, *args, **kwargs):
		self.object = None
		self.form = self.form_class(request.POST, request.FILES)
		if self.form.is_valid():
			filename = self.form.cleaned_data.get('files1')
			self.form.instance.author = self.request.user
			link = self.form.cleaned_data.get('video_link')
			if(link == ''):link = 'None'
			classes = self.form.cleaned_data.get('classes')
			subject = self.form.cleaned_data.get('subject')
			ls_link = link.split('=')
			print(ls_link,ls_link[-1])
			self.object = self.form.save(commit=False)
			self.object.files = filename
			self.object.classes = classes
			self.object.subject = subject
			if(link == 'None'):
				self.object.video_link = 'None'
			else:
				self.object.video_link = 'https://www.youtube.com/embed/'+ls_link[-1]
			self.object.save()
		return redirect('forum')

	def get_context_data(self, **kwargs):
		context = super().get_context_data(**kwargs)
		liked = False
		user = get_user(self.request)
		liked_posts = user.upvotes.filter(id__in=self.get_queryset()).values_list('id', flat=True)
		context['liked_posts'] = liked_posts
		context['form'] = self.form
		get_params = self.request.GET
		if(len(get_params) == 0):
			context['po'] = True
			context['post1'] = Post.objects.all().order_by('-date')
		context['searchform'] = SortByForm(get_params)
		return context
	

class PostDetailView(LoginRequiredMixin,DetailView):
	model = Post
 
class PostCreateView(LoginRequiredMixin,CreateView):
    model = Post
    form_class  = PostForm
    
    def form_valid(self,form):
        form.instance.author = self.request.user
        
        return super().form_valid(form)
    

class PostDeleteView(LoginRequiredMixin,UserPassesTestMixin,DeleteView):
	model = Post
	success_url = '/forum'

	def test_func(self):
		post = self.get_object()
		if(self.request.user == post.author):
			return True
		return False


def UpvoteView(request,pk):
	print(request.user,request.user.is_authenticated)
	if(request.user.is_authenticated):
		post = get_object_or_404(Post,id=request.POST.get('post_id'))
		if(post.upvotes.filter(id=request.user.id).exists()):
			post.upvotes.remove(request.user)
		else:
			post.upvotes.add(request.user)
		return HttpResponseRedirect(reverse('forum'))
	else:return redirect('login')
 
@login_required
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

