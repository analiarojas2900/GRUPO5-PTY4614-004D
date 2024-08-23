from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.
def base(request):
    return render(request, 'base/base.html')