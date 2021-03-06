"""LearningApp URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from django.conf import settings
from django.conf.urls.static import static
from forum import views as forum_views
from resources import views as resources_views
from users import views as user_views
from django.contrib.auth import views as auth_views
from django.contrib.auth.decorators import login_required
from bookappointment import views as bookappointmentviews
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',include('forum.urls')),
    path('resources/',include('resources.urls')),
    path('users/',include('users.urls')),
    path('bookappointment/',include('bookappointment.urls')),
    
    path('',login_required(forum_views.PostListView.as_view()),name='forum'),
    path('resources/',resources_views.ResourcesListView.as_view(),name='resources'),
    path('register/',user_views.register,name='register'),
    path('profile/',user_views.profile,name='profile'),
    path('newprofile/',user_views.newprofile,name='newprofile'),
    path('login/',auth_views.LoginView.as_view(template_name = 'users/login.html',redirect_authenticated_user=True),name='login'),
    path('logout/',auth_views.LogoutView.as_view(template_name = 'users/logout.html'),name='logout'),
    path('bookappointment/',bookappointmentviews.bookappointment,name='bookappointment'),
]

if(settings.DEBUG):
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)