from django.shortcuts import render
from django.http import HttpResponse
from django.template import RequestContext, loader
from models import BookInfo

def index(request):
    booklist = BookInfo.objects.all()
    template = loader.get_template('booktest/index.html')
    context = RequestContext(request, {'booklist': booklist})
    return HttpResponse(template.render(context))
def bkdetail(request, id):
    book = BookInfo.objects.get(pk=id)
    template = loader.get_template('booktest/bk.html')
    context = RequestContext(request, {'book': book})
    return HttpResponse(template.render(context))