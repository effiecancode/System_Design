# app's controllers

from django.shortcuts import get_object_or_404, render, redirect

def hello(request):
    return render(request, "helloworld/home.html")