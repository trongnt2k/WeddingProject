from django.db.models import Count, Sum
from django.db.models.functions import TruncMonth, TruncYear
from django.template.response import TemplateResponse
from django.utils.html import mark_safe
from django.contrib import admin
from .models import User, WeddingHall, Service, DishesAndDrink, Menu, Wedding
from django.urls import path


# Register your models here.


class WeddingHallAdmin(admin.ModelAdmin):
    list_display = ['name', 'time_wedding', 'active']
    search_fields = ['name', 'time_wedding']
    readonly_fields = ['image']

    def image(self, obj):
        if obj:
            return mark_safe(
                "<img src='/static/{img_url}' alt='{alt}' width='120' />".format(img_url=obj.wedding_hall_images.name,
                                                                                 alt=obj.name))


class ServiceAdmin(admin.ModelAdmin):
    list_display = ['name', 'active']
    search_fields = ['name']
    readonly_fields = ['image']

    def image(self, obj):
        if obj:
            return mark_safe(
                "<img src='/static/{img_url}' alt='{alt}' width='120' />".format(img_url=obj.service_images.name,
                                                                                 alt=obj.name))


class DishesAndDrinkMenuInlineAdmin(admin.TabularInline):
    model = Menu.dishes_and_drink.through


class DishesAndDrinkAdmin(admin.ModelAdmin):
    list_display = ['name', 'active']
    search_fields = ['name']
    inlines = [DishesAndDrinkMenuInlineAdmin, ]
    readonly_fields = ['image']

    def image(self, obj):
        if obj:
            return mark_safe(
                "<img src='/static/{img_url}' alt='{alt}' width='120' />".format(img_url=obj.dishes_drinks_images.name,
                                                                                 alt=obj.name))


class MenuAdmin(admin.ModelAdmin):
    search_fields = ['name']
    inlines = [DishesAndDrinkMenuInlineAdmin, ]
    readonly_fields = ['image']
    list_display = ['name', 'total_money']

    def image(self, obj):
        if obj:
            return mark_safe(
                "<img src='/static/{img_url}' alt='{alt}' width='120' />".format(img_url=obj.menu_images.name,
                                                                                 alt=obj.name))


class UserAdmin(admin.ModelAdmin):
    readonly_fields = ['image']

    def image(self, obj):
        if obj:
            return mark_safe("<img src='/static/{img_url}' alt='{alt}' width='120' />".format(img_url=obj.avatar.name,
                                                                                              alt=obj.last_name))


class WeddingAdmin(admin.ModelAdmin):
    readonly_fields = ['image', 'number_desk', 'total_price', 'services', 'user', 'menu', 'wedding_hall']
    list_display = ['organize_date', 'total_price', 'user']
    search_fields = ['organize_date', 'total_price', 'user']

    def image(self, obj):
        if obj:
            return mark_safe("<img src='/static/{img_url}' alt='{alt}' width='120' />".format(img_url=obj.wedding_images.name,
                                                                                              alt=obj.id))


class WeddingAppAdminSite(admin.AdminSite):
    site_header = 'HỆ THỐNG ĐẶT TIỆC CƯỚI TRỰC TUYẾN'
    index_title = 'Trang Quản Trị'

    def get_urls(self):
        return [
                   path('wedding-month-stats', self.wedding_month_stats),
                   path('wedding-year-stats', self.wedding_year_stats),
                   path('weddingRevenue-month-stats', self.weddingRevenue_month_stats),
                   path('weddingRevenue-year-stats', self.weddingRevenue_year_stats)
               ] + super().get_urls()

    def wedding_month_stats(self, request):
        wedding = Wedding.objects.all()

        try:
            fromDate = request.POST.get('fromDate')
            toDate = request.POST.get('toDate')
            if fromDate is not None and toDate is not None:
                wedding = wedding.filter(organize_date__range=[fromDate, toDate])
        except:
            print("Error")

        wedding_month_stats = wedding \
            .annotate(month=TruncMonth('organize_date')) \
            .values('month') \
            .annotate(c=Count('id')) \
            .values('month', 'c') \
            .order_by('month')

        return TemplateResponse(request, 'admin/wedding-month-stats.html', {
            'wedding_month_stats': wedding_month_stats,
        })

    def wedding_year_stats(self, request):
        wedding = Wedding.objects.all()

        try:
            fromDate = request.POST.get('fromDate')
            toDate = request.POST.get('toDate')
            if fromDate is not None and toDate is not None:
                wedding = wedding.filter(organize_date__range=[fromDate, toDate])
        except:
            print("Error")

        wedding_year_stats = wedding \
            .annotate(year=TruncYear('organize_date')) \
            .values('year') \
            .annotate(c=Count('id')) \
            .values('year', 'c') \
            .order_by('year')

        return TemplateResponse(request, 'admin/wedding-year-stats.html', {
            'wedding_year_stats': wedding_year_stats
        })

    def weddingRevenue_month_stats(self, request):
        wedding = Wedding.objects.all()

        try:
            fromDate = request.POST.get('fromDate')
            toDate = request.POST.get('toDate')
            if fromDate is not None and toDate is not None:
                wedding = wedding.filter(created_date__range=[fromDate, toDate])
        except:
            print("Error")

        weddingRevenue_month_stats = wedding \
            .annotate(month=TruncMonth('created_date')) \
            .values('month') \
            .annotate(r=Sum('total_price')) \
            .values('month', 'r') \
            .order_by('month')

        return TemplateResponse(request, 'admin/weddingRevenue_month_stats.html', {
            'weddingRevenue_month_stats': weddingRevenue_month_stats
        })

    def weddingRevenue_year_stats(self, request):
        wedding = Wedding.objects.all()

        try:
            fromDate = request.POST.get('fromDate')
            toDate = request.POST.get('toDate')
            if fromDate is not None and toDate is not None:
                wedding = wedding.filter(created_date__range=[fromDate, toDate])
        except:
            print("Error")

        weddingRevenue_year_stats = wedding \
            .annotate(year=TruncYear('organize_date')) \
            .values('year') \
            .annotate(r=Sum('total_price')) \
            .values('year', 'r') \
            .order_by('year')

        return TemplateResponse(request, 'admin/weddingRevenue_year_stats.html', {
            'weddingRevenue_year_stats': weddingRevenue_year_stats
        })


admin_site = WeddingAppAdminSite('myadmin')

admin_site.register(User, UserAdmin)
admin_site.register(WeddingHall, WeddingHallAdmin)
admin_site.register(Service, ServiceAdmin)
admin_site.register(DishesAndDrink, DishesAndDrinkAdmin)
admin_site.register(Menu, MenuAdmin)
admin_site.register(Wedding, WeddingAdmin)
