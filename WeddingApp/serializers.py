from rest_framework.fields import SerializerMethodField
from rest_framework.serializers import ModelSerializer

from .models import WeddingHall, Service, Menu, User, DishesAndDrink, Wedding, Comment, Action, Rating


class WeddingHallSerializer(ModelSerializer):
    wedding_hall_images = SerializerMethodField()

    def get_wedding_hall_images(self, weddinghall):
        request = self.context['request']
        name = weddinghall.wedding_hall_images.name
        if name.startswith("static/"):
            path = '/%s' % name
        else:
            path = "/static/%s" % name

        return request.build_absolute_uri(path)

    class Meta:
        model = WeddingHall
        fields = ['id', 'name', 'time_wedding', 'wedding_hall_images', 'location', 'wedding_hall_price', 'description']


class ServiceSerializer(ModelSerializer):
    service_images = SerializerMethodField()

    def get_service_images(self, service):
        request = self.context['request']
        name = service.service_images.name
        if name.startswith("static/"):
            path = '/%s' % name
        else:
            path = "/static/%s" % name

        return request.build_absolute_uri(path)

    class Meta:
        model = Service
        fields = ['id', 'name', 'service_images', 'price', 'description']


class DishesAndDrinkSerializer(ModelSerializer):
    dishes_drinks_images = SerializerMethodField()

    def get_dishes_drinks_images(self, dishesanddrink):
        request = self.context['request']
        name = dishesanddrink.dishes_drinks_images.name
        if name.startswith("static/"):
            path = '/%s' % name
        else:
            path = "/static/%s" % name

        return request.build_absolute_uri(path)

    class Meta:
        model = DishesAndDrink
        fields = ['id', 'name', 'dishes_drinks_images', 'price']


class MenuSerializer(ModelSerializer):
    menu_images = SerializerMethodField()

    def get_menu_images(self, menu):
        request = self.context['request']
        name = menu.menu_images.name
        if name.startswith("static/"):
            path = '/%s' % name
        else:
            path = "/static/%s" % name

        return request.build_absolute_uri(path)

    class Meta:
        model = Menu
        fields = ['id', 'name', 'menu_images', 'total_money']


class UserSerializer(ModelSerializer):

    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'email', 'username', 'password', 'avatar']
        extra_kwargs = {
            'password': {'write_only': 'true'}
        }

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        user.save()

        return user

    def update(self, instance, validated_data):
        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.email = validated_data.get('email', instance.email)
        instance.set_password(validated_data.get('password', instance.password))
        instance.avatar = validated_data.get('avatar', instance.avatar)
        instance.save()

        return instance


class WeddingSerializer(ModelSerializer):
    wedding_images = SerializerMethodField()
    rate = SerializerMethodField()

    def get_rate(self, wedding):
        request = self.context['request']
        if request and request.user.is_authenticated:
            r = wedding.rating_set.filter(creator=request.user).first()
            if r:
                return r.rate

        return -1;

    def get_wedding_images(self, wedding):
        request = self.context['request']
        name = wedding.wedding_images.name
        if name.startswith("static/"):
            path = '/%s' % name
        else:
            path = "/static/%s" % name

        return request.build_absolute_uri(path)

    class Meta:
        model = Wedding
        fields = ['id', 'wedding_images', 'description', 'number_desk', 'organize_date', 'total_price', 'rate']


class CommentSerializer(ModelSerializer):

    class Meta:
        model = Comment
        fields = ['id', 'get_username', 'content', 'created_date', 'updated_date']


class ActionSerializer(ModelSerializer):
    class Meta:
        model = Action
        fields = ['id', 'type', 'created_date']


class RatingSerializer(ModelSerializer):
    class Meta:
        model = Rating
        fields = ['id', 'rate', 'created_date']
