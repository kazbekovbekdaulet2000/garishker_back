from django.urls import path
from reaction.models.comment import Comment
from reaction.views.bookmark_view import BookmarkAction
from reaction.views.comment_view import CommentDetail, CommentList
from reaction.views.like_view import LikeAction
from shop.models.product.product import Product
from shop.views.product import ProductBookmarked, ProductDetail, ProductLiked, ProductList


urlpatterns = [
    path('products/', ProductList.as_view()),
    path('products/<int:id>/', ProductDetail.as_view()),

    path('products/bookmarked/', ProductBookmarked.as_view()),
    path('products/liked/', ProductLiked.as_view()),

    path('products/<int:id>/like/', LikeAction.as_view(model=Product, lookup_field='id')),
    path('products/<int:id>/save/', BookmarkAction.as_view(model=Product, lookup_field='id')),
    path('products/<int:id>/comments/', CommentList.as_view(model=Product)),
    path('products/<int:id>/comments/<int:comment_id>/', CommentDetail.as_view(model=Product)),
    path('products/<int:id>/comments/<int:comment_id>/like/', LikeAction.as_view(model=Comment, lookup_field='comment_id')),
    path('products/<int:id>/comments/<int:comment_id>/save/', BookmarkAction.as_view(model=Comment, lookup_field='comment_id')),
]
