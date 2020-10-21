from bookappointment.models import Appointments
from users.models import Teacher

def appointmentcount(request):
    if(request.user.is_authenticated and request.user.profile.role == 2):
            u = Teacher.objects.filter(user = request.user)[0]
            count = Appointments.objects.filter(teacher = u, status='pending')
            count = len(count)
            return {'appointmentcount': count}
    else:
        return {'a':0}