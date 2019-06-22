from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls import url

from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('legal_notice/', views.legal_notice, name='legal_notice'),
    path('my_account/', views.my_account, name='my_account'),
    path('display_all_idea/', views.display_all_idea, name='display_all_idea'),
    path('display_by_category/<str:cat>/', views.display_by_category, name='display_by_category'),
    path('display_categories/', views.display_categories, name='display_categories'),
    path('detail_idea/<int:id>/', views.detail_idea, name='detail_idea'),
    path('add_idea/', views.add_idea, name='add_idea'),
    path('edit_idea/<int:id>/', views.edit_idea, name='edit_idea'),
    path('delete_idea/<int:id>/', views.delete_idea, name='delete_idea'),
    path('likes_idea/', views.likes_idea, name='likes_idea'),
    path('week_menu/', views.week_menu, name='week_menu'),
    path('delete_week_idea/<int:id>/', views.delete_week_idea, name='delete_week_idea'),
    path('del_all_week_idea/', views.del_all_week_idea, name='del_all_week_idea'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
