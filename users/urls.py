from django.urls import path
from .views import setformvalues
urlpatterns = [
    path('setvals/',setformvalues,name='setvals'),
]

#<app>/<model>_<viewtype>.html