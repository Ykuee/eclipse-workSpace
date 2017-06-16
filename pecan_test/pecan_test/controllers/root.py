from pecan import expose, redirect, abort, Response
from webob.exc import status_map
from wsme import types as wtypes
import pecan
from pecan_test.controllers import v1con

class BooksController(object):
    @expose(generic=True)
    def index(self):
        return 'hello'
    
    @expose(generic=True, template='bookt.html')
    def index_get(self):
        return dict()
    
    @index.when(method='POST', template='json')
    def index_POST(self, **kw):
        if kw.has_key("a2"):
            return str(kw["a2"])
        if kw.has_key("b2"):
            redirect('https://www.baidu.com')
   
    @expose()
    def bs(self):
        return 'dfs'
   
    @expose(template='bestsellers.html')
    def get_bs(self):
        return dict()

    @expose(template='bestsellers.html')
    def post_bs(self, **kw):
        if kw["username"] and kw["password"] != None:
            username = {'username':kw["username"]}
            password = {'password':kw["password"]}
            return (username, password)
        else:
            return "error"
    @expose()
    def hello(self):
        return Response('Hello, World!', 202)
'''
    @expose(template='bestsellers.html')
    def bs(self,**kw):
        assert pecan.request.path == '/book/bs/'
        username = pecan.request.POST.get('username')
        password = pecan.request.POST.get('password')
    
        pecan.response.status = 403
        pecan.response.text = u'Bad Login!'
        return username,password
'''
    

    
'''    
    @index.when(method='POST')
    def index_post(self, **kw):
        redirect('https://www.taobao.com?id=%s' % kw)
'''
class RootController(object):

    @expose(generic=True, template='index.html')
    def index(self):
        return dict()
    

    @index.when(method='POST')
    def index_post(self, **kw):
        if kw.request.post.get('q') != None and kw.request.post.get('a')== None:
            redirect('https://pecan.readthedocs.io/en/latest/search.html?q=%s' % kw)

    @index.when(method='POST')
    def index_post1(self, **kw):
        redirect('https://www.baidu.com?wb=%s' % kw)

    @expose('error.html')
    def error(self, status):
        try:
            status = int(status)
        except ValueError:  # pragma: no cover
            status = 500
        message = getattr(status_map.get(status), 'explanation', '')
        return dict(status=status, message=message)
    
    @expose(template='testpost.html')
    def Test(self):
        return {'msg': 'penis!'}
    @expose(template='gggg.html')
    def gggg(self):
        return {'msg': 'penis!'}
    
    @expose('json')
    @expose('testt.html')
    def hello(self):
        return {'msg': 'Hello!'}
    

    book = BooksController()
    v1 = v1con.V1Controller()
    
    @expose(wtypes.text)
    def get(self):
        return "webdemo"

    
        
