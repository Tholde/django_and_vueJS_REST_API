from django.contrib import admin

from agri.models import Person


class PersonAdmin(admin.ModelAdmin):
    list_display = ['id','fullname', 'username', 'email', 'password', 'contact', 'address', 'image', 'rdoc']


admin.site.register(Person, PersonAdmin)
