from rest_framework import generics
from rest_framework import permissions
from shop.models.order.user_bag import UserBag
from shop.models.order.user_bag_item import UserBagItem
from shop.serializers.order.bag_serializer import UserBagCreateSerializer, UserBagItemCreateSerializer, UserBagItemSerializer, UserBagSerializer


class UserBagList(generics.RetrieveAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'uuid'
    permission_classes = (permissions.AllowAny, )
    queryset = UserBag.objects.all()
    serializer_class = UserBagSerializer


class UserBagProductsList(generics.ListCreateAPIView):
    permission_classes = (permissions.AllowAny, )
    pagination_class = None

    def get_queryset(self):
        return UserBagItem.objects.filter(order_id=self.kwargs['uuid'])

    def get_serializer_class(self):
        if(self.request.method == 'POST'):
            return UserBagItemCreateSerializer
        return UserBagItemSerializer


class UserBagDetail(generics.RetrieveUpdateDestroyAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = 'id'
    permission_classes = (permissions.AllowAny, )
    queryset = UserBagItem.objects.all()

    def get_serializer_class(self):
        if(self.request.method == "GET"):
            return UserBagItemSerializer
        return UserBagItemCreateSerializer


class CreateUserBag(generics.CreateAPIView):
    permission_classes = (permissions.AllowAny, )
    queryset = UserBag.objects.all()
    serializer_class = UserBagCreateSerializer
