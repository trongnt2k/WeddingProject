from django.urls import path, include
from . import views
from rest_framework import routers
from .admin import admin_site


router = routers.DefaultRouter()
router.register('weddinghalls', views.WeddingHallViewSet, 'weddinghall')
router.register('services', views.ServiceViewSet), 'service'
router.register('menus', views.MenuViewSet, 'menu')
router.register('users', views.UserViewSet)
router.register('weddings', views.WeddingViewSet, 'wedding')
router.register('comments', views.CommentViewSet)


urlpatterns = [
    path('', include(router.urls)),
    path('admin/', admin_site.urls),
    path('oauth2-info/', views.AuthInfo.as_view())
]
