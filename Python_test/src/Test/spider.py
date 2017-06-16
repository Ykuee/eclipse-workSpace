#!/usr/bin/python
# -*- coding: UTF-8 -*-

import urllib
import re

def getHtml(url):
    page = urllib.urlopen(url)
    html = page.read()
    f = open('F:\Python\py1.txt', 'w')
    f.write(html)
    f.close()
    return html

def getImg(html):
    reg = r'src="(.+?\.jpg)"'
    imgre = re.compile(reg)
    imglist = re.findall(imgre, html)
    x = 0
    for imgurl in imglist:
        urllib.urlretrieve(imgurl, 'F:\Python\%s.jpg' % x)
        x += 1
    return imglist
    
html = getHtml("http://www.dilidili.wang/")

print getImg(html)