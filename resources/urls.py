from django.urls import path
from .views import ResourcesCreateView,ResourcesUpdateView,ResourcesDeleteView,UserResourcesListView,ResourcesListView,ResourcesDetailView

urlpatterns = [
    path('',ResourcesListView.as_view(), name='resources'),
    path('new/', ResourcesCreateView.as_view(), name='resources-create'),
    path('<int:pk>/update/', ResourcesUpdateView.as_view(), name='resources-update'),
    path('<int:pk>/delete/', ResourcesDeleteView.as_view(), name='resources-delete'),
    path('user/<str:username>/', UserResourcesListView.as_view(), name='user-resources'),
    path('resources/<int:pk>/', ResourcesDetailView.as_view(), name='resource-detail'),
]

#<app>/<model>_<viewtype>.html