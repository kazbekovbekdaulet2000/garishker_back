from rest_framework import permissions
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response


class Like(APIView):
    permission_classes = [permissions.IsAuthenticated]
    model = None

    def post(self, request, *args, **kwargs):
        item = self.model.objects.get(id=self.kwargs['id'])
        if(request.user in item.likes.all()):
            item.likes.remove(request.user)
            return Response({"liked": False}, status=status.HTTP_202_ACCEPTED)
        else:
            item.likes.add(request.user)
            return Response({"liked": True}, status=status.HTTP_202_ACCEPTED)


class Save(APIView):
    permission_classes = [permissions.IsAuthenticated]
    model = None

    def post(self, request, *args, **kwargs):
        item = self.model.objects.get(id=self.kwargs['id'])
        if(request.user in item.saves.all()):
            item.saves.remove(request.user)
            return Response(
                {"bookmarked": False}, status=status.HTTP_202_ACCEPTED)
        else:
            item.saves.add(request.user)
            return Response(
                {"bookmarked": True}, status=status.HTTP_202_ACCEPTED)
