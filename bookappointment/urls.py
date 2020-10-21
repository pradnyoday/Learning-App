from django.urls import path
from .views import bookappointment,approve,updatestatus
urlpatterns = [
    path('',bookappointment,name='bookappointment'),
    path('approve/',approve,name='approve'),
    path('updatestatus/<int:pk>/<int:status>',updatestatus,name='updatestatus'),
]