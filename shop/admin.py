from django.contrib import admin
from shop.models.order.order import Order
from shop.models.order.order_item import OrderItem
from shop.models.order.user_bag import UserBag
from shop.models.order.user_bag_item import UserBagItem
from shop.models.product.product_category import ProductCategory
from shop.models.product.product_compound import ProductCompound

from shop.models.product.product_image import ProductImage
from shop.models.product.product_item import ProductItem
from shop.models.product.product_size import ProductSize
from .models.product.product import Product


class GenericReactionAdmin(admin.ModelAdmin):
    readonly_fields = ('likes_count', 'comments_count',
                       'reviews_count', 'bookmarks_count')

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


class OrderItemAdmin(admin.TabularInline):
    def has_add_permission(self, request, obj=None):
        return False

    def has_change_permission(self, request, obj=None):
        return False

    def has_delete_permission(self, request, obj=None):
        return False
    model = OrderItem
    extra = 0


class OrderAdmin(admin.ModelAdmin):
    def has_add_permission(self, request, obj=None):
        return False

    def has_delete_permission(self, request, obj=None):
        return False
    readonly_fields = ('ord_id', 'name', 'email', 'phone', 'address', 'city',
                       'post_id', 'delivery_type', 'total_sum', 'total_discount_sum')
    inlines = (OrderItemAdmin, )


class UserOrderItemAdmin(admin.TabularInline):
    def has_add_permission(self, request, obj=None):
        return False

    def has_change_permission(self, request, obj=None):
        return False

    def has_delete_permission(self, request, obj=None):
        return False
    model = UserBagItem
    extra = 0

class UserOrderAdmin(admin.ModelAdmin):
    def has_add_permission(self, request, obj=None):
        return False

    def has_delete_permission(self, request, obj=None):
        return False
    inlines = (UserOrderItemAdmin, )


admin.site.register(Product, ProductAdmin)
admin.site.register(ProductSize)
admin.site.register(ProductCategory)
admin.site.register(ProductCompound)
admin.site.register(Order, OrderAdmin)
admin.site.register(UserBag, UserOrderAdmin)
