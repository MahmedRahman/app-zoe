import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zoe/app/modules/account/views/account_view.dart';
import 'package:zoe/app/modules/brand/views/brand_view.dart';
import 'package:zoe/app/modules/cart/views/cart_view.dart';
import 'package:zoe/app/modules/category/views/category_view.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/routes/app_pages.dart';

class LayoutView extends GetView {
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
              HomePage(),
              CartView(),
              AccountView()
            ],
          );
        },
      ),
    );
  }
}
