import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/data/CategoryModel.dart';
import 'package:zoe/app/data/productModel.dart';
import 'package:zoe/app/modules/account/views/account_view.dart';
import 'package:zoe/app/modules/brand/views/brand_view.dart';
import 'package:zoe/app/modules/cart/views/cart_view.dart';
import 'package:zoe/app/modules/category/views/category_view.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  var selectindex = 2.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: SizedBox(
                  height: 100,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              title: Text('الرئيسية'),
              leading: Image.asset('assets/menu/home.png'),
              onTap: () {
                selectindex.value = 0;
                Get.back();
              },
            ),
            ListTile(
              title: Text('الاقسام'),
              leading: Image.asset('assets/menu/category.png'),
              onTap: () {
                selectindex.value = 1;
                Get.back();
              },
            ),
            ListTile(
              title: Text('الماركات'),
              leading: Image.asset('assets/menu/brand.png'),
              onTap: () {
                selectindex.value = 2;
                Get.back();
              },
            ),
            ListTile(
              title: Text('سلة التسوق'),
              leading: Image.asset('assets/menu/shopping.png'),
              onTap: () {
                selectindex.value = 3;
                Get.back();
              },
            ),
            ListTile(
              title: Text('حسابى'),
              leading: Image.asset('assets/menu/user.png'),
              onTap: () {
                selectindex.value = 4;
                Get.back();
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: SizedBox(
          height: 100,
          child: Image.asset('assets/logo.png'),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Get.toNamed(Routes.SplashView);
            },
          )
        ],
      ),
      bottomNavigationBar: Obx(() {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: CurvedNavigationBar(
            index: selectindex.value,
            animationDuration: Duration(milliseconds: 400),
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.red,
            color: Colors.white,
            height: 75,
            items: [
              SvgPicture.asset(
                'assets/menu/category.svg',
                width: selectindex.value == 0 ? 32 : 20,
                color: selectindex.value == 0 ? Colors.white : Colors.red,
              ),
              Icon(
                Icons.local_offer,
                size: selectindex.value == 1 ? 32 : 20,
                color: selectindex.value == 1 ? Colors.white : Colors.red,
              ),
              SvgPicture.asset(
                'assets/menu/home.svg',
                width: selectindex.value == 2 ? 32 : 20,
                color: selectindex.value == 2 ? Colors.white : Colors.red,
              ),
              SvgPicture.asset(
                'assets/menu/shopping.svg',
                width: selectindex.value == 3 ? 32 : 20,
                color: selectindex.value == 3 ? Colors.white : Colors.red,
              ),
              SvgPicture.asset(
                'assets/menu/user.svg',
                width: selectindex.value == 4 ? 32 : 20,
                color: selectindex.value == 4 ? Colors.white : Colors.red,
              ),
            ],
            onTap: (value) {
              selectindex.value = value;
              print(value);
            },
          ),
        );
      }),
      body: Obx(
        () {
          return IndexedStack(
            index: selectindex.value,
            children: [
              CategoryView(),
              BrandView(),
              HomePage(controller: controller),
              CartView(),
              AccountView()
            ],
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset('assets/offer.png'),
          SizedBox(
            height: 10,
          ),
          Title(
            label: 'الاقسام',
          ),
          buildCategory(),
          Title(
            label: 'الماركات',
          ),
          buildBrand(),
          Title(
            label: 'العطور النسائية',
            sublabel: 'المزيد',
          ),
          ProductView(controller: controller),
          Title(
            label: 'العطور الرجالية',
            sublabel: 'المزيد',
          ),
          ProductView(controller: controller),
        ],
      ),
    );
  }

  SizedBox buildBrand() {
    return SizedBox(
      height: Get.height * .1,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.getBrand().length,
          itemBuilder: (context, index) {
            BrandModel brand = controller.getBrand().elementAt(index);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ProductCategoryView);
                },
                child: Container(
                  width: Get.width * .5,
                  height: Get.height * .2,
                  decoration: BoxDecoration(
                    color: brand.color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(brand.img),
                ),
              ),
            );
          }),
    );
  }

  SizedBox buildCategory() {
    return SizedBox(
      height: Get.height * .1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.getCategory().length,
        itemBuilder: (context, index) {
          CategoryModel category = controller.getCategory().elementAt(index);
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.ProductCategoryView);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: Get.width * .5,
                height: Get.height * .2,
                decoration: BoxDecoration(
                  color: category.color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Image.asset(category.img),
                  title: Text(category.name),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.getProduct().length,
          itemBuilder: (context, index) {
            ProductModel product = controller.getProduct().elementAt(index);
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ProductDetailView);
              },
              child: Container(
                width: Get.width * .5,
                height: Get.height * .2,
                child: ProductItem(product: product),
              ),
            );
          }),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.ProductDetailView);
          },
          child: Card(
            elevation: 2,
            shadowColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Flexible(
                  child: PageView(
                    children: [
                      Image.asset(
                        product.image,
                      ),
                      Image.asset(
                        product.image,
                      ),
                      Image.asset(
                        product.image,
                      ),
                      Image.asset(
                        product.image,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(product.subtitle),
                      Text(
                        '${product.price} س.ر',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.ltr,
                        children: [
                          RatingBarIndicator(
                            rating: 3,
                            itemCount: 5,
                            itemSize: 25.0,
                            direction: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          Text('(${product.ratig})')
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 15,
          child: Container(
            child: product.isfavorite
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_outline_outlined),
          ),
        ),
        Positioned(
          top: 10,
          left: 15,
          child: Container(
              child: product.isoffers
                  ? Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(32)),
                      child: Center(
                        child: Text(
                          product.discount,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : null),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({this.label, this.sublabel});

  final String label;
  final String sublabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              textAlign: TextAlign.right,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.ProductCategoryView);
              },
              child: Text(
                sublabel ?? '',
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
