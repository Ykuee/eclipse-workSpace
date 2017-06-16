#! /usr/bin/env python   
# -*- coding: utf-8 -*-   

from django.http.response import HttpResponse
from django.shortcuts import render
# Create your views here.
def index(request):
    return HttpResponse(u"<h1>This is your first page.</h>")

def add(request):
    a = request.GET['a']
    b = request.GET['b']
    c = int(a)+int(b)
    return HttpResponse(str(c))

def add2(request, a, b):
    c = int(a) + int(b)
    return HttpResponse(str(c))

def add_html(request):
    return render(request, 'home.html')