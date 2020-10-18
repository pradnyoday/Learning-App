from django.shortcuts import render,get_object_or_404,redirect
from django.views.generic.edit import CreateView
from django.views.generic import ListView,DetailView,CreateView,UpdateView,DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin,UserPassesTestMixin
from django.views.generic.edit import FormMixin,ModelFormMixin
from .models import Post,Replies,Assessment,Questions
from users.models import Student
from .forms import PostForm,CommentForm,AssessmentForm,QuestionForm
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect
from django.http import JsonResponse
from django.urls import reverse_lazy,reverse
import numpy as np
import pandas as pd 
import pymysql
import plotly.graph_objects as go
from plotly.offline import plot

# Create your views here.
def getStudentAttendance(request):
	lectures_list = [23,24,23,10,0,20,25,21,23,20,23,20]

	connection = pymysql.connect(host = 'localhost', user = 'root', password = '', database = 'learning_app_trial')
	sql = 'SELECT COUNT(present) as present_count, MONTH(date) as month FROM `attendance` WHERE user_id = 1 AND present = 1 GROUP BY MONTH(date)'
	df = pd.read_sql(sql, connection)
	present_list = df['present_count'].tolist()
	month_list = df['month'].tolist()
	for i in range(12):
		if i+1 not in month_list:
			present_list.insert(i,0)

	months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

	fig = go.Figure()
	fig.add_trace(go.Bar(
		x=months,
		y=lectures_list,
		name='Total Days',
		marker_color='indianred'
	))
	fig.add_trace(go.Bar(
		x=months,
		y=present_list,
		name='Attendance',
		marker_color='lightsalmon'
	))

	# Here we modify the tickangle of the xaxis, resulting in rotated labels.
	fig.update_layout(barmode='group', xaxis_tickangle=-45)
	fig.update_layout(title_text='Monthly Attendance', title_x = 0.5, xaxis_title="Months",
                    yaxis_title="Your Attendance",
                    font=dict(
                    family="Roboto",
                    size=14,
                    color="RebeccaPurple"
                    ))
	plot_div = plot(fig, output_type = 'div')
	return render(request,'forum/attendance.html',{'fig1':plot_div})

def getStudentList(request):
	data = Student.objects.all()
	students = {"data": data}
	return render(request, 'forum/teacher_attendance.html', students)

def fetchAttendance(request, user_id):
	plot_div = getTeacherAttendance(user_id)
	return render(request,'forum/attendance.html',{'fig1':plot_div})


def getTeacherAttendance(user_id):
	lectures_list = [23,24,23,10,0,20,25,21,23,20,23,20]
	print(user_id)
	connection = pymysql.connect(host = 'localhost', user = 'root', password = '', database = 'learning_app')
	sql = "SELECT COUNT(present) as present_count, MONTH(date) as month FROM `forum_attendance` WHERE user_id = '{0}' AND present = 1 GROUP BY MONTH(date)".format(user_id)
	df = pd.read_sql(sql, connection)
	present_list = df['present_count'].tolist()
	month_list = df['month'].tolist()
	for i in range(12):
		if i+1 not in month_list:
			present_list.insert(i,0)

	months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

	fig = go.Figure()
	fig.add_trace(go.Bar(
		x=months,
		y=lectures_list,
		name='Total Days',
		marker_color='indianred'
	))
	fig.add_trace(go.Bar(
		x=months,
		y=present_list,
		name='Attendance',
		marker_color='lightsalmon'
	))

	# Here we modify the tickangle of the xaxis, resulting in rotated labels.
	fig.update_layout(barmode='group', xaxis_tickangle=-45)
	fig.update_layout(title_text='Monthly Attendance', title_x = 0.5, xaxis_title="Months",
					yaxis_title="Your Attendance",
					font=dict(
					family="Roboto",
					size=14,
					color="RebeccaPurple"
					))
	plot_div = plot(fig, output_type = 'div')
	return plot_div
	

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
		self.form =  self.form_class()
		# Explicitly states what get to call:
		return ListView.get(self, request, *args, **kwargs)
    
	def post(self, request, *args, **kwargs):
		# When the form is submitted, it will enter here
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

def addAssessment(request):
    if request.method == 'POST':
        form = AssessmentForm(request.POST)
        if form.is_valid():
            obj = form.save(commit=False)
            obj.teacher_id = request.user.pk
            obj.save()
            id = obj.pk
            return redirect('forum-question', pk=id)
    else:
        form = AssessmentForm()
    return render(request, 'forum/fillAssessment.html', {'form':form})

def addQuestion(request, pk):
    query = Assessment.objects.filter(pk=pk)

    if request.method == 'POST':
        form = QuestionForm(request.POST)
        if form.is_valid():
            obj = form.save(commit=False)
            obj.assessment_id = pk
            if(query[0].teacher_id == request.user.pk):
                obj.save()
            
            return redirect('forum-question', pk=pk)
    else:
        form = QuestionForm()
    return render(request, 'forum/fillQuestions.html', {'form':form})

def dispque(request):
	data = Questions.objects.all()
	que = {"data": data}
	return render(request, 'forum/attemptAssessment.html',que)

# def particularque(request,que):
# 	data=Questions.objects.filter(question=que).values()
# 	#print(data)
# 	re=list(data)
# 	return JsonResponse(json.dumps(re), safe=False)

# def addmark(request,que,ans):
# 	#data=Question.objects.filter(Que=que).values()
# 	#ourid = json.loads(request.POST.get('Ans'))
# 	print(ans)
# 	return HttpResponse('<h1>Page was found</h1>')