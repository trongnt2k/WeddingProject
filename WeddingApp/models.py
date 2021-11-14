from django.contrib.auth.models import AbstractUser
from django.db import models


# Create your models here.
# Người dùng
class User(AbstractUser):  # AbstractUser sẽ có thông tin chứng thực sẵn
    avatar = models.ImageField(upload_to='images/%Y/%m', default=None)

    class Meta:
        verbose_name_plural = 'Người dùng'


# Sảnh cưới
class WeddingHall(models.Model):
    name = models.CharField(max_length=100, null=False)
    time_wedding = models.CharField(max_length=10, null=True)
    wedding_hall_images = models.ImageField(upload_to='images/%Y/%m', default=None)
    location = models.CharField(max_length=100, null=True)
    wedding_hall_price = models.BigIntegerField()
    description = models.TextField(null=True, blank=True)
    active = models.BooleanField(default=True)

    class Meta:
        verbose_name_plural = 'Sảnh cưới'

    def __str__(self):
        return self.name


# Dịch vụ
class Service(models.Model):
    name = models.CharField(max_length=100, null=False, unique=True)
    service_images = models.ImageField(upload_to='images/%Y/%m', default=None)
    price = models.BigIntegerField(null=False)
    description = models.TextField(null=True, blank=True)
    active = models.BooleanField(default=True)

    class Meta:
        verbose_name_plural = 'Dịch vụ'

    # lưu luôn giờ tạo, auto_now_add: lưu thời gian tại thời điểm tạo lần đầu tiên
    # auto_add luôn thay đổi lại thời gian tại lúc được cập nhật

    def __str__(self):
        return self.name


# Đồ ăn uống
class DishesAndDrink(models.Model):
    name = models.CharField(max_length=100, null=False, unique=True)
    dishes_drinks_images = models.ImageField(upload_to='images/%Y/%m', default=None)
    price = models.BigIntegerField(null=False)
    active = models.BooleanField(default=True)

    class Meta:
        verbose_name_plural = 'Món ăn'

    def __str__(self):
        return self.name


# Menu
class Menu(models.Model):
    name = models.CharField(max_length=100, null=False, unique=True, default=None)
    menu_images = models.ImageField(upload_to='images/%Y/%m', default=None)
    dishes_and_drink = models.ManyToManyField('DishesAndDrink', related_name='dishes_and_drink', blank=True)

    @property
    def total_money(self):
        totalprice = 0
        dishesanddrink = self.dishes_and_drink.all()
        for d in dishesanddrink:
            totalprice += d.price
        return totalprice

    class Meta:
        verbose_name_plural = 'Thực đơn'

    def __str__(self):
        return self.name


# Tiệc Cưới
class Wedding(models.Model):
    wedding_images = models.ImageField(upload_to='images/%Y/%m', default="images/2021/09/dam-cuoi-khao-khat-5.jpg")
    number_desk = models.IntegerField()
    organize_date = models.DateField(null=True)
    created_date = models.DateTimeField(auto_now_add=True)
    description = models.TextField(null=True, blank=True)
    total_price = models.BigIntegerField()
    services = models.ManyToManyField('Service', blank=True, related_name='services')
    menu = models.ForeignKey(Menu, on_delete=models.SET_NULL, null=True)
    wedding_hall = models.ForeignKey(WeddingHall, on_delete=models.SET_NULL, related_name='wedding_hall', null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user', null=True)

    class Meta:
        verbose_name_plural = 'Tiệc cưới'


# Phản hồi
class Comment(models.Model):
    content = models.TextField()
    wedding = models.ForeignKey(Wedding, on_delete=models.CASCADE)
    creator = models.ForeignKey(User, on_delete=models.CASCADE)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    @property
    def get_username(self):
        return self.creator.username

    def __str__(self):
        return self.content


class MyAction(models.Model):
    class Meta:
        abstract = True
        unique_together = ("wedding", "creator")

    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    wedding = models.ForeignKey(Wedding, on_delete=models.CASCADE)
    creator = models.ForeignKey(User, on_delete=models.CASCADE)


class Action(MyAction):
    LIKE, HAHA, HEART = range(3)
    ACTIONS = [
        (LIKE, 'like'),
        (HAHA, 'haha'),
        (HEART, 'heart')
    ]
    type = models.PositiveSmallIntegerField(choices=ACTIONS, default=1)


class Rating(MyAction):
    rate = models.PositiveSmallIntegerField(default=0)
