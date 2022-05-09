from django.contrib import admin
from shop.models.product_category import ProductCategory
from shop.models.product_compound import ProductCompound

from shop.models.product_image import ProductImage
from shop.models.product_item import ProductItem
from shop.models.product_size import ProductSize
from .models.product import Product


class GenericReactionAdmin(admin.ModelAdmin):
    readonly_fields = ('likes_count', 'comments_count', 'reviews_count', 'bookmarks_count')
    class Meta:
        abstract = True

class ProductItemsAdmin(admin.TabularInline):
    model = ProductItem
    extra = 0


class ProductImageAdmin(admin.TabularInline):
    exclude = ('image_thumb480', 'image_thumb720', 'image_thumb1080')
    model = ProductImage
    extra = 0


class ProductAdmin(GenericReactionAdmin):
    search_fields = ('name_kk', 'description_kk', 'name_ru', 'description_ru')
    inlines = [ProductImageAdmin, ProductItemsAdmin]


admin.site.register(Product, ProductAdmin)
admin.site.register(ProductSize)
admin.site.register(ProductCategory)
admin.site.register(ProductCompound)