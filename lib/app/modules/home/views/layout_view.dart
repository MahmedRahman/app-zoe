import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/account/views/account_view.dart';
import 'package:zoe/app/modules/brand/views/brand_view.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/cart/views/cart_view.dart';
import 'package:zoe/app/modules/category/views/category_view.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class LayoutView extends StatelessWidget {
  //HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(color: Colors.black),
        title: SizedBox(
          height: 100,
          child: Image.asset('assets/logo.png'),
        ),
        actions: [
        InkWell(
            onTap: () {
               Kselectindex.value = 3;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Badge(
                badgeColor: Colors.black,
                badgeContent: Obx(() {
                  return Text(
                    Get.find<CartController>().shopCount.value.toString(),
                    style: TextStyle(color: Colors.white),
                  );
                }),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),



        ],
        centerTitle: true,
      ),
      bottomNavigationBar: custembottomNavigationBar(),
      body: Obx(() {
        return IndexedStack(
          index: Kselectindex.value,
          children: [
            CategoryView(),
            BrandView(),
            HomePage(),
            CartView(),
            (Get.find<UserAuth>().getUserToken() == null)
                ? loginuser()
                : AccountView(),
          ],
        );
      }),
    );
  }

  Container custembottomNavigationBar() {
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
      child: Obx(() {
        return CurvedNavigationBar(
          index: Kselectindex.value,
          animationDuration: const Duration(milliseconds: 400),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Color(0xFF4C1711),
          color: Colors.white,
          height: 75,
          items: [
            SvgPicture.asset(
              'assets/menu/category.svg',
              width: Kselectindex.value == 0 ? 32 : 20,
              color: Kselectindex.value == 0 ? Colors.white : Color(0xFF4C1711),
            ),
            SvgPicture.asset(
              'assets/menu/brands.svg',
              width: Kselectindex.value == 1 ? 32 : 20,
              color: Kselectindex.value == 1 ? Colors.white : Color(0xFF4C1711),
            ),
            SvgPicture.asset(
              'assets/menu/home.svg',
              width: Kselectindex.value == 2 ? 32 : 20,
              color: Kselectindex.value == 2 ? Colors.white : Color(0xFF4C1711),
            ),
            SvgPicture.asset(
              'assets/menu/shopping.svg',
              width: Kselectindex.value == 3 ? 32 : 20,
              color: Kselectindex.value == 3 ? Colors.white : Color(0xFF4C1711),
            ),
            SvgPicture.asset(
              'assets/menu/user.svg',
              width: Kselectindex.value == 4 ? 32 : 20,
              color: Kselectindex.value == 4 ? Colors.white : Color(0xff4C1711),
            ),
          ],
          onTap: (value) {
            Kselectindex.value = value;
          },
        );
      }),
    );
  }

  Widget loginuser() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'برجاء تسجيل الدخول',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 60,
            width: Get.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: KprimaryColor, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Get.toNamed(Routes.SigninView);
              },
              child: Text('تسجيل دخول'),
            ),
          )
        ],
      )),
    );
  }
}
