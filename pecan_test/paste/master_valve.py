#!/usr/bin/python
# -*- coding: UTF-8 -*-
#master_valve.py  
from wsgiref.simple_server import make_server  
from paste import httpserver  
from paste.deploy import loadapp  
import os  
  
if __name__ == '__main__':  
    configfile = 'config.ini'  
    appname = 'main'
    wsgi_app = loadapp('config:%s' % os.path.abspath(configfile), appname)  
    print wsgi_app
    print os.path.abspath(configfile)
    #httpserver.serve(loadapp('config:configure.ini', relative_to = '.'), host = '127.0.0.1', port=8000)  
  
    server = make_server('localhost', 8000, wsgi_app)  
    print "已启动，在127.0.0.1:8000"
    server.serve_forever()
    