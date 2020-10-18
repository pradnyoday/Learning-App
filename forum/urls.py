from django.urls import path
from .views import PostCreateView,PostDeleteView,UserPostListView,PostListView,PostDetailView,UpvoteView,CommentView

urlpatterns = [
    path('',PostListView.as_view(), name='forum'),
    path('new/', PostCreateView.as_view(), name='post-create'),
    path('<int:pk>/delete/', PostDeleteView.as_view(), name='post-delete'),
    path('user/<str:username>/', UserPostListView.as_view(), name='user-posts'),
    path('post/<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('upvote/<int:pk>',UpvoteView,name='upvote_post',),
    path('comments/<int:pk>',CommentView,name='post-comment'),
]

#<app>/<model>_<viewtype>.html