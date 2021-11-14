from rest_framework.decorators import action
from rest_framework.parsers import MultiPartParser
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import WeddingHall, Service, Menu, User, Wedding, Comment, Action, Rating
from .paginator import BasePagination
from .serializers import WeddingHallSerializer, ServiceSerializer, MenuSerializer, UserSerializer, WeddingSerializer, \
    CommentSerializer, DishesAndDrinkSerializer, ActionSerializer, RatingSerializer
from rest_framework import viewsets, permissions, generics, status
from django.conf import settings


# Create your views here.


class WeddingHallViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = WeddingHall.objects.filter(active=True)
    serializer_class = WeddingHallSerializer
    pagination_class = BasePagination

    def get_queryset(self):
        weddinghall = WeddingHall.objects.filter(active=True)

        s = self.request.query_params.get("s")
        p = self.request.query_params.get("p")
        t = self.request.query_params.get("t")
        if s is not None:
            weddinghall = weddinghall.filter(name__icontains=s)
        if p == 'asc':
            weddinghall = weddinghall.order_by('wedding_hall_price')
        if p == 'des':
            weddinghall = weddinghall.order_by('-wedding_hall_price')
        if t is not None:
            weddinghall = weddinghall.filter(time_wedding__icontains=t)

        return weddinghall


class ServiceViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = Service.objects.filter(active=True)
    serializer_class = ServiceSerializer
    pagination_class = BasePagination

    def get_permissions(self):
        if self.action == 'list' or 'retrieve':
            return [permissions.AllowAny()]

        return [permissions.IsAuthenticated()]

    def get_queryset(self):
        service = Service.objects.filter(active=True)

        s = self.request.query_params.get("s")
        p = self.request.query_params.get("p")
        if s is not None:
            service = service.filter(name__icontains=s)
        if p == 'asc':
            service = service.order_by('price')
        if p == 'des':
            service = service.order_by('-price')

        return service


class MenuViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = Menu.objects.exclude(dishes_and_drink__isnull=True)
    serializer_class = MenuSerializer
    pagination_class = BasePagination

    def get_permissions(self):
        if self.action == 'list' or 'get_dishes_and_drink' or 'retrieve':
            return [permissions.AllowAny()]

        return [permissions.IsAuthenticated()]

    def get_queryset(self):
        menu = Menu.objects.exclude(dishes_and_drink__isnull=True)

        s = self.request.query_params.get("s")
        p = self.request.query_params.get("p")
        if s is not None:
            menu = Menu.filter(name__icontains=s)
        if p == 'asc':
            menu = menu.order_by('total_money')
        if p == 'des':
            menu = menu.order_by('-total_money')

        return menu

    @action(methods=['get'], detail=True, url_path='dishes-and-drink')
    def get_dishes_and_drink(self, request, pk):
        dishes_and_drink = Menu.objects.get(pk=pk).dishes_and_drink.filter(active=True)

        return Response(DishesAndDrinkSerializer(dishes_and_drink, many=True, context={'request': request}).data,
                        status=status.HTTP_200_OK)


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.UpdateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer

    def get_permissions(self):
        if self.action == 'get_current_user':
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['get'], detail=False, url_path="current-user")
    def get_current_user(self, request):
        return Response(self.serializer_class(request.user).data,
                        status=status.HTTP_200_OK)

        return Response(status=status.HTTP_403_FORBIDDEN)


class WeddingViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    serializer_class = WeddingSerializer
    pagination_class = BasePagination

    def get_permissions(self):
        if self.action == 'list' \
                or 'retrieve' \
                or 'get_wedding_services' \
                or 'get_wedding_menu' \
                or 'get_wedding_weddinghall':
            return [permissions.AllowAny()]

        return [permissions.IsAuthenticated()]

    def get_queryset(self):
        wedding = Wedding.objects.all()

        dmin = self.request.query_params.get('dmin')
        dmax = self.request.query_params.get('dmax')
        p = self.request.query_params.get("p")

        if dmin and dmax is not None:
            wedding = wedding.filter(organize_date__range=[dmin, dmax])
        if dmin is not None and dmax is None:
            wedding = wedding.filter(organize_date__gte=dmin)
        if dmax is not None and dmin is None:
            wedding = wedding.filter(organize_date__lte=dmax)
        if p == 'asc':
            wedding = wedding.order_by('total_price')
        if p == 'des':
            wedding = wedding.order_by('-total_price')

        return wedding

    @action(methods=['post'], detail=False, url_path="create-wedding")
    def create_wedding(self, request, pk=None):
        numberdesk = request.data.get('number_desk')
        organizedate = request.data.get('organize_date')
        description = request.data.get('description')
        serviceid = request.data.get('service_id')
        menuid = request.data.get('menu_id')
        weddinghallid = request.data.get('weddinghall_id')
        totalprice = 0

        if serviceid:
            for s in serviceid:
                serviceprice = Service.objects.get(pk=s)
                totalprice += int(serviceprice.price)
        if menuid:
            menu = Menu.objects.get(pk=menuid)
            totalprice += int(menu.total_money) * int(numberdesk)
        if weddinghallid:
            weddinghall = WeddingHall.objects.get(pk=weddinghallid)
            totalprice += int(weddinghall.wedding_hall_price)
        if totalprice:
            numberdesk = int(numberdesk)
            wedding = Wedding.objects.create(number_desk=numberdesk,
                                             organize_date=organizedate,
                                             description=description,
                                             total_price=totalprice,
                                             menu=menu,
                                             wedding_hall=weddinghall,
                                             user=request.user)
            if serviceid:
                for s in serviceid:
                    service = Service.objects.get(pk=s)
                    wedding.services.add(service)
                wedding.save()

            return Response(WeddingSerializer(wedding, context={'request': request}).data,
                            status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['post'], detail=True, url_path="add-comment")
    def add_comment(self, request, pk):
        content = request.data.get('content')
        if content:
            c = Comment.objects.create(content=content,
                                       wedding=self.get_object(),
                                       creator=request.user)

            return Response(CommentSerializer(c).data,
                            status=status.HTTP_201_CREATED)

        return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=True, url_path="get-comment")
    def get_comment(self, request, pk):
        comment = self.get_object()
        return Response(CommentSerializer(comment.comment_set.order_by("-id").all(), many=True).data,
                        status=status.HTTP_200_OK)

    @action(methods=['post'], detail=True, url_path='like')
    def add_action(self, request, pk):
        try:
            type = int(request.data['type'])
        except IndexError | ValueError:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            action = Action.objects.create(type=type,
                                           creator=request.user,
                                           wedding=self.get_object())
            return Response(ActionSerializer(action).data, status=status.HTTP_200_OK)

    @action(methods=['post'], detail=True, url_path='rating')
    def add_rating(self, request, pk):
        try:
            rate = int(request.data['rate'])
        except IndexError | ValueError:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            rating = Rating.objects.update_or_create(creator=request.user,
                                                     wedding=self.get_object(),
                                                     defaults={"rate": rate})
            return Response(RatingSerializer(rating).data, status=status.HTTP_200_OK)

    @action(methods=['get'], detail=True, url_path='wedding-service')
    def get_wedding_services(self, request, pk):
        services = Wedding.objects.get(pk=pk).services.filter(active=True)

        return Response(ServiceSerializer(services, many=True, context={'request': request}).data,
                        status=status.HTTP_200_OK)

    @action(methods=['get'], detail=True, url_path='wedding-menu')
    def get_wedding_menu(self, request, pk):
        menu = Wedding.objects.get(pk=pk).menu

        return Response(MenuSerializer(menu, context={'request': request}).data,
                        status=status.HTTP_200_OK)

    @action(methods=['get'], detail=True, url_path='wedding-weddinghall')
    def get_wedding_weddinghall(self, request, pk):
        weddinghall = Wedding.objects.get(pk=pk).wedding_hall

        return Response(WeddingHallSerializer(weddinghall, context={'request': request}).data,
                        status=status.HTTP_200_OK)


class CommentViewSet(viewsets.ViewSet, generics.DestroyAPIView,
                     generics.UpdateAPIView):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
    permission_classes = [permissions.IsAuthenticated]

    def destroy(self, request, *args, **kwargs):
        if request.user == self.get_object().creator:
            return super().destroy(request, *args, **kwargs)

        return Response(status=status.HTTP_403_FORBIDDEN)

    def partial_update(self, request, *args, **kwargs):
        if request.user == self.get_object().creator:
            return super().partial_update(request, *args, **kwargs)

        return Response(status=status.HTTP_403_FORBIDDEN)


class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)
