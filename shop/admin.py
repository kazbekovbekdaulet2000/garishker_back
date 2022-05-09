from django.contrib import admin

from shop.models.product_image import ProductImage
from .models.product import Product
# Register your models here.

class ProductImageAdmin(admin.TabularInline):
    exclude = ('image_thumb480', 'image_thumb720', 'image_thumb1080')
    model = ProductImage
    extra = 0


class ProductAdmin(admin.ModelAdmin):
    search_fields = ('name_kk', 'description_kk', 'name_ru', 'description_ru')
    inlines = [ProductImageAdmin]

admin.site.register(Product, ProductAdmin)
# admin.site.register(ProductImage)