from django.urls import path
from .views import ResourcesCreateView,ResourcesDeleteView,UserResourcesListView,ResourcesListView,ResourcesDetailView

urlpatterns = [
    path('',ResourcesListView.as_view(), name='resources'),
    path('new/', ResourcesCreateView.as_view(), name='resource-create'),
    path('<int:pk>/delete/', ResourcesDeleteView.as_view(), name='resource-delete'),
    path('user/<str:username>/', UserResourcesListView.as_view(), name='user-resources'),
    path('resource/<int:pk>/', ResourcesDetailView.as_view(), name='resource-detail'),
]

#<app>/<model>_<viewtype>.html