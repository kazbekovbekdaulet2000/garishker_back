"""config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, re_path, path
from django.conf import settings
from django.conf.urls.static import static
from rest_framework_swagger.views import get_swagger_view
schema_view = get_swagger_view(title='Garyshker API')
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi


schema_view = get_schema_view(
    openapi.Info(
        title="Garyshker API",
        default_version='v1',
        description="desc",
        contact=openapi.Contact(email="kazbekov.bekdaulet2000@gmail.com"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)


urlpatterns = [
    re_path('admin/', admin.site.urls),
    re_path('auth/', include('user.urls')),
    # re_path('dobro/', include('dobro.urls')),
    re_path('courses/', include('course.urls')),
    re_path('tests/', include('quiz.urls')),
    re_path('edu/', include('obrazovanie.urls')),
    re_path('support/', include('support.urls')),

    # ckeditor
    re_path(r'^ckeditor/', include('ckeditor_uploader.urls')),
    
    # django_prometheus
    path('prometheus/', include('django_prometheus.urls')),

    # Swagger
    re_path('docs/swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    re_path('docs/swagger/api.json/', schema_view.without_ui(cache_timeout=0), name='schema-swagger-ui'),
    re_path('docs/swagger/redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
