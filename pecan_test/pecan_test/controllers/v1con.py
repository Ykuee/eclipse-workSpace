#!/usr/bin/python
# -*- coding: UTF-8 -*-
from pecan import rest
from wsme import types as wtypes
from pecan import expose


class V1Controller(rest.RestController):
    @expose()
    def index(self):
        return"sdfad"
    
    @expose(wtypes.text)
    def get(self):
        return "webdemo v1controller"