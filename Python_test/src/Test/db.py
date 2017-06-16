#!/usr/bin/python
# -*- coding: UTF-8 -*-
import MySQLdb
import threading

class _Engine(object):
    def __init__(self,connect):
        self._connect = connect;
    def connect(self):
        return self.connect();
    
engine = None;

'''
class _Engine(object):
    def __init__(self,user,passwd,db):
        self.user = user;
        self.passwd = passwd;
        self.db = db;
    def connect(self):
        mysql = 'user="%s",passwd="%s",db="%s"' % (self.user, self.passwd, self.db)
        return mysql;
    
engine = None;

a = _Engine("root","123456","shopping");
print a.connect();
'''
class _DbCtx(threading.local):
    def __init__(self):
        self.connection = None
        self.transactions = 0
        
    def is_init(self):
        return not self.connection is None
    
    def init(self):
        self.connection =0
        self.transactions = 0
        
    def cleanup(self):
        self.connection.cleanup()
        self.connection = None()
        
    def cursor(self):
        return self.connection.cursor()
_db_ctx = _DbCtx()
    
        