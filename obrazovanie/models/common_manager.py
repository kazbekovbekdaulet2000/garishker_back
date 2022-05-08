from django.db import models
from reaction.models.bookmark import Bookmark
from reaction.models.comment import Comment
from reaction.models.like import Like
from reaction.models.review import Review
from django.conf import settings

User = settings.AUTH_USER_MODEL

class ReactionManager(models.Manager):
    def list_bookmarked(self, user: User):
        ids = Bookmark.objects.get_user_objects(model=self.model, user=user).values_list('object_id', flat=True)
        return self.get_queryset().filter(id__in=ids)
    
    def list_liked(self, user: User):
        ids = Like.objects.get_user_objects(model=self.model, user=user).values_list('object_id', flat=True)
        return self.get_queryset().filter(id__in=ids)

    def list_reviews(self, user: User):
        ids = Review.objects.get_user_objects(model=self.model, user=user).values_list('object_id', flat=True)
        return self.get_queryset().filter(id__in=ids)
    
    def list_comments(self, user: User):
        ids = Comment.objects.get_user_objects(model=self.model, user=user).values_list('object_id', flat=True)
        return self.get_queryset().filter(id__in=ids)

    def liked(self, user: User, object_id: int):
        return Like.objects.exists(model=self.model, user=user, object_id=object_id)

    def saved(self, user: User, object_id: int):
        return Bookmark.objects.exists(model=self.model, user=user, object_id=object_id)