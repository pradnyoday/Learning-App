from django.urls import path
from .views import dispque,addAssessment,addQuestion,getStudentAttendance,getStudentList,fetchAttendance,PostCreateView,PostDeleteView,UserPostListView,PostListView,PostDetailView,UpvoteView,CommentView

urlpatterns = [
    path('',PostListView.as_view(), name='forum'),
    path('new/', PostCreateView.as_view(), name='post-create'),
    path('<int:pk>/delete/', PostDeleteView.as_view(), name='post-delete'),
    path('user/<str:username>/', UserPostListView.as_view(), name='user-posts'),
    path('post/<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('upvote/<int:pk>',UpvoteView,name='upvote_post',),
    path('comments/<int:pk>',CommentView,name='post-comment'),
    path('student_attendance/<int:user_id>',getStudentAttendance,name='forum-student-attendance'),
    path('fetch_attendance/<int:user_id>',fetchAttendance,name='forum-fetch-attendance'),
    path('teacher_attendance/',getStudentList,name='forum-student-list'),
    path('assessment/', addAssessment, name='forum-ass'),
    path('question/<int:pk>/', addQuestion, name='forum-question'),
    path('dispque/', dispque, name='forum-quiz-question'),
]

#<app>/<model>_<viewtype>.html