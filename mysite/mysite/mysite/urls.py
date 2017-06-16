#! /usr/bin/env python   
# -*- coding: utf-8 -*-   

"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from learn import views as learn_views
from ykyk import views as ykyk_views
from dbtest import views as dbtest_views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', learn_views.index),   
    url(r'^add/$', learn_views.add, name="add"),   
    url(r'^add/(\d+)/(\d+)$', learn_views.add2,name = "add2"),
    url(r'^add/html/', learn_views.add_html, name = "add_html"),
    url(r'^ykyk/', ykyk_views.home, name='ykyk'),
    url(r'^base/', ykyk_views.home1, name='base'),
    url(r'^test/', ykyk_views.home2, name='test'),
    url(r'^dbtest/', dbtest_views.dbtest1, name='dbtest'),
]
