#! /usr/bin/env python   
# -*- coding: utf-8 -*-   

from django.shortcuts import render

# Create your views here.
def home(request):
    string = u"我是耿悦"
    Tlist = ['ksjdf','skkkdk','dffoeo','sdfs']
    
    return render(request, "ykyk.html",{'Tlist':Tlist})
    
def home1(request):
    return render(request, "base.html")

def home2(request):
    List = map(str, range(100))
    var = 10
    return render(request, 'test.html', {'var':var})