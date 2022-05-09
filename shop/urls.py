from django.urls import path
from shop.views.product import ProductDetail, ProductList


urlpatterns = [
    path('products/', ProductList.as_view()),
    path('products/<int:id>/', ProductDetail.as_view())
]
