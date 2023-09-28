from django.urls import path
from . import views

urlpatterns = [
    path('upload/', views.upload_file, name='upload-file'),
    path('files/', views.get_files, name='file-list'),
]