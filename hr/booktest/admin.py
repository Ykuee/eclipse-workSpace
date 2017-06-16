from django.contrib import admin

from models import BookInfo
from models import HeroInfo
from models import MyName
'''
admin.site.register(BookInfo)
admin.site.register(HeroInfo)
admin.site.register(MyName)
'''



from booktest.models import BookInfo,HeroInfo,MyName
class HeroInfoInline(admin.TabularInline):
    model = HeroInfo
    extra = 1
    
class BookInfoAdmin(admin.ModelAdmin):
    list_display = ['pk', 'btitle', 'bpub_date']
    list_filter = ['btitle']
    search_fields = ['btitle']
    list_per_page = 10
    inlines = [HeroInfoInline]
    
class HeroInfoAdmin(admin.ModelAdmin):
    search_fields = ['hBook']
    list_filter = ['hcontent']
    search_fields = ['hname']
    list_per_page = 10
    list_display = ['id', 'hname', 'hgender', 'hcontent']

class MyNameAdmin(admin.ModelAdmin):
    search_fields = ['name']
    list_display = ['pk', 'name', 'age']
    list_filter = ['name']
    search_fields = ['name']
    list_per_page = 10
    
admin.site.register(BookInfo, BookInfoAdmin)
admin.site.register(HeroInfo, HeroInfoAdmin)
admin.site.register(MyName, MyNameAdmin)


