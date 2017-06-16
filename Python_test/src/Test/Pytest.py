#!/usr/bin/python
# -*- coding: UTF-8 -*-
import math
import time
import datetime
import string
from datetime import date
import MySQLdb
import unittest  
'''
print "name"
class myname(object):
    a = [1,2,3,4,5]
    def __init__(self, a):
        print a[1:2]
    def pr (self):
        for x in self.a:
            print x
       
b = ["y", "k", "u","i"]
c = myname(b)
c.pr()

conn = MySQLdb.connect(user="root",passwd="123456",db="shopping")
cur = conn.cursor();
cur.execute("select * from user;");
for data in cur.fetchall():
    print data;
cur.close();
conn.commit();
conn.close();
'''

'''
1~4个数字，能组成多少三位数。没有重复
for x in range(1,5):
    for y in range(1,5):
        for z in range(1,5):
            if (x != y) and (x != z) and (y != z) :
                print x, y, z
'''
 
'''
i = int(raw_input("input:"))  
#print i;
arr = [1000000,600000,400000,200000,100000,0]
brr = [0.01,0.015,0.03,0.05,0.075,0.1]
r = 0
for x in range(0,6):
    if i > arr[x]:
        r += (i-arr[x])*brr[x]
        print (i-arr[x])*brr[x]
        i = arr[x]
print r
'''

'''
排列大小，由小到大
i = int(raw_input("输入比较的个数："))
l = []
for x in range(i):
    z = int(raw_input("输入第%s个数" % (x + 1)))
    l.append(z)
l.sort()
print l
'''
'''
i = [1, 2, 3, 4,]
o = i[:]
print o
'''
'''
#九九乘法表
for i in range(1, 10):
    print 
    for j in range(1, i+1):
        print "%d*%d=%d" % (i, j, i*j),
'''


'''
myD = {1:"a", 2:"b"}
for key, value in dict.items(myD):
    print key,value
    time.sleep(3)#输出暂停3s
'''
        
'''
#暂停一秒输出，并格式化时间        
print time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
time.sleep(1)
print time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
'''
    
'''for x in range(100,1000):
    j = x/100
    k = x/10%10
    l = x%10
    
    if x == j**3 + k**3 + l**3:
        print x'''
'''        
def score(n):
    if n >= 90:
        print "学生成绩为优"
    elif n >= 60:
        print "学生成绩为良"
    else :
        print "学生成绩为差"
n = int(raw_input("输入学生成绩:"))
score(n)
'''
        
 
'''
if __name__ == '__main__':
# 输出今日日期，格式为 dd/mm/yyyy。更多选项可以查看 strftime() 方法
print(datetime.date.today().strftime('%d/%m/%Y'))
# 创建日期对象
miyazakiBirthDate = datetime.date(1941, 1, 5)
print(miyazakiBirthDate.strftime('%d/%m/%Y'))
# 日期算术运算
miyazakiBirthNextDay = miyazakiBirthDate + datetime.timedelta(days=1)
print(miyazakiBirthNextDay.strftime('%d/%m/%Y'))
# 日期替换
miyazakiFirstBirthday = miyazakiBirthDate.replace(year=miyazakiBirthDate.year + 1)
print(miyazakiFirstBirthday.strftime('%d/%m/%Y'))
'''
'''
now = datetime.datetime.now()
print now
print type(now)
print time.time()
print time.localtime()
print datetime.date.today()
print datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
'''
'''
try:
    ri = raw_input("请输入:\n")
except Exception, e:
    print "shit"
finally:
    print "holy shit"
def findout (str):
    let = 0;
    sp = 0;
    nu = 0;
    ot = 0;
    for x in ri:
        if x.isalpha():
            let += 1
        elif x.isspace():
            sp += 1
        elif x.isdigit():
            nu += 1
        else:
            ot += 1
    print "字母:%d,空格:%d,数字:%d,符号:%d" % (let,sp,nu,ot)
findout(ri)
'''
'''
a = int(raw_input("输入循环多少次:"))
b = int(raw_input("输入循环的数:"))
def fk(i,o):
    sum = 0
    sn = []
    for x in range(i):
        sum += o
        o = o *10
        sn.append(sum)
    for y in range(i):
        print "第%d位数:" %(y+1), sn[y]
    print "输出结果是:%d" % reduce(lambda x,y : x + y,sn )
fk(a,b)
'''

'''
#将输入的string倒过来输出.
def letback(s,l):
    d = l
    if d !=0:
        d = l - 1
        print s[d]
        letback(s,d)
            
a = raw_input("String input:")
letback(a,len(a))
print "是%d位数." % len(a)
'''
'''
def lethui(s,l):
    d = l
    s = int(s)
    f = math.ceil(l/2)
    while f != 0:
        if s[f-1] == s[f+1]:
            print "Yes"
        else:
            print "No"
    f = f - 1
a = raw_input("String input:")
lethui(a,len(a))
'''
'''
list = ['sjkf', 'sdfse', 'dfdfsa']
d ={ "name":"ssss", "age":23}

for i in list:
    print i

for i in range(20):
    print i+1
    
for (x,y) in d.items():
    print x , y
    print "dict[%s]=" % x,y
'''
'''
list = map(str, range(100))#将数组内的数字转换成string格式.
for x in list:
    a = x+x
    print x
    print a
'''
'''
Created on 2016-7-22
@author: Jennifer
Project:登录百度测试用例
'''
'''
from selenium import webdriver
import unittest, time

class YoudaoTest(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Chrome()
        self.driver.implicitly_wait(30) #隐性等待时间为30秒
        self.base_url = "http://www.youdao.com"
    
    def test_youdao(self):
        driver = self.driver
        driver.get(self.base_url + "/")
        driver.find_element_by_id("translateContent").clear()
        driver.find_element_by_id("translateContent").send_keys(u"你好")
        driver.find_element_by_id("translateContent").submit()
        time.sleep(3)
        page_source=driver.page_source
        self.assertIn( "hello",page_source) 

    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main()
'''

'''
import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Chrome()
driver.get("http://www.baidu.com")

# Record the search window
search_windows = driver.current_window_handle

# Deal with Baidu search
elem = driver.find_element_by_id("kw")
elem.clear()
elem.send_keys("pycon")
elem.send_keys("python selenium programmer")
search = driver.find_element_by_id("su")
search.click()

# Open a registration page
login = driver.find_element_by_name('tj_login')
login.click()
driver.find_element_by_link_text(u'立即注册').click()

# Get all window handles
all_handles = driver.window_handles

# If handle is not search, input some thing in registration page
for handle in all_handles:
    if handle != search_windows:
       driver.switch_to.window(handle)
       print('now register window!')
       driver.find_element_by_name("userName").send_keys('username')
       driver.find_element_by_name('phone').send_keys('password')
       time.sleep(2)

# If handle is search, switch to the search windows and do some search again
for handle in all_handles:
    if handle == search_windows:
       driver.switch_to.window(search_windows)
       print('now sreach window!')
       driver.find_element_by_id('TANGRAM__PSP_2__closeBtn').click()
       driver.find_element_by_id("kw").send_keys("selenium")
       driver.find_element_by_id("su").click()
       time.sleep(2)

driver.close()
'''
'''
from selenium import webdriver
import unittest, time

class BaiduTest(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Chrome()
        self.driver.implicitly_wait(30) #隐性等待时间为30秒
        self.base_url = "https://www.baidu.com"
    
    def test_baidu(self):
        driver = self.driver
        driver.get(self.base_url + "/")
        driver.find_element_by_id("kw").clear()
        driver.find_element_by_id("kw").send_keys("good")
        driver.find_element_by_id("su").click()
        time.sleep(30)
        title=driver.title
        self.assertEqual(title, u"unittest_百度搜索") 

    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main()
'''
'''
memblist = ['FunctionTestCase', 'TestCase', 'TestLoader', 'TestProgram', 
            'TestResult', 'TestSuite','TextTestRunner', 'defaultTestLoader',
            'findTestCases', 'getTestCaseNames', 'main', 'makeSuite']  
for memb in memblist:
    cur = getattr(unittest, memb)
    print cur
    print help(cur)
'''
''' 
def fang ():
    print "sdfas"

fang()
'''
'''    
class Test (object):
    age = 10
    
    def ttt(self):
        print Test.age, "454"
    
    def __init__(self):
        self.name = "Ykue"
        self.age = 23
        age = 500
        print self.age
        
    def done (self):
        self.age += 100
        age = 500
        print self.age
    
    print age, "8888"
a = Test()
a.done()
a.ttt()
a.__init__()
print a.age, "2222"
'''
'''
class TestStringMethods1(unittest.TestCase):
    
    def test_upper(self):
        self.assertEqual('foo'.upper(), 'FOO')
        
    def test_isupper(self):
        self.assertTrue('FOO'.isupper())
        self.assertFalse('Foo'.isupper())
        
    def test_split(self):
        s = 'hello world'
        self.assertEqual(s.split(), ['hello', 'world'])
        with self.assertRaises(TypeError):
            s.split(2)
        
if __name__ == '__main__':
    unittest.main()
'''
'''
class IntegerArithmeticTestCase(unittest.TestCase):
    def testAdd(self):  ## test method names begin 'test*'
        self.assertEqual((1 + 2), 3)
        self.assertEqual(0 + 1, 1)
    def testMultiply(self):
        self.assertEqual((0 * 10), 0)
        self.assertEqual((5 * 8), 40)

if __name__ == '__main__':
    unittest.main()
'''
'''
def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')])
    return '<h1>Hello, weeeeb!</h1>'
'''
'''    
def deco(func):
    print("before myfunc() called.")
    func()
    print("  after myfunc() called.")
    return func
 
@deco
def myfunc():
    print(" myfunc() called.")
 
c = myfunc()
myfunc()
'''
'''
def foo(a):

    def subfoo(b):
        print b
        return(b + a)
    print a
    subfoo(a)
    return a
f = foo('content')
c = "aaa" + "bbb"
print f, c
'''
'''
from wsgiref.simple_server import make_server  
from webob import Request, Response    #后面介绍这个模块  
  
class APPTest(object):  
    def __call__(self, environ, start_response):  
        urll =  ['%s : %s' % (key, value) for key,value in environ.items()]  #传递进来的environ环境变量  
  
        print '\n'.join(urll)  
        print '\n\n\n'  

        req = Request(environ) #处理环境变量，生成Request对象，代表客户端HTTP请求传递而来的环境变量  
        print req  
  
        print '\n\n\n'  
        return self.test(environ, start_response)  
  
    def test(self, environ, start_response):  
  
        urll =  ['%s : %s' % (key, value) for key,value in environ.items()]  
  
        print '\n'.join(urll)  
        print '\n\n\n'  
  
        res = Response()  #Response类类型的实例对象res，实现__call__函数可以直接作为函数调用，对于HTTP响应 header和body的封装  
        print res  
        print '\n\n\n'  
        print type(res)  
  
        res.status = 200  
        res.body = 'hello world'  
        return res(environ, start_response)  
  
application = APPTest()  
  
httpd = make_server('127.0.0.1', 8000, application)  
print 'Listen on port 8000....'  
httpd.serve_forever()  
'''
'''
def use_duck( Duck ):
    Duck.swim()
    Duck.gaga()
class Duck:
    def swim(self):
        print "swim"
    def gaga(self):
        print "gaga"
        
little_duck = Duck()
use_duck(little_duck)
'''




