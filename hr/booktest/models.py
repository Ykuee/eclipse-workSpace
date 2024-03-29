from __future__ import unicode_literals

from django.db import models
from unittest.util import _MAX_LENGTH


class BookInfo(models.Model):
    btitle = models.CharField(max_length=20)
    bpub_date = models.DateTimeField()
    def __str__(self):
        return "%d" % self.pk

class HeroInfo(models.Model):
    hname = models.CharField(max_length=20)
    hgender = models.BooleanField()
    hcontent = models.CharField(max_length=100)
    hBook = models.ForeignKey('BookInfo')
    def __str__(self):
        return "%d" % self.pk
    
class MyName(models.Model):
    name = models.CharField(max_length=50)
    age = models.IntegerField()
    good = models.BooleanField()