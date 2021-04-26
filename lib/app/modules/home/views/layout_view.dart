import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/account/views/account_view.dart';
import 'package:zoe/app/modules/brand/views/brand_view.dart';
import 'package:zoe/app/modules/cart/views/cart_view.dart';
import 'package:zoe/app/modules/category/views/category_view.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class LayoutView extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  /*    drawer: Drawer(
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
           
            ),
            ListTile(
              title: Text('الرئيسية'),
              leading: Image.asset('assets/menu/home.png'),
              onTap: () {
                controller.selectindex.value = 2;
                Get.back();
              },
            ),
            ListTile(
              title: Text('الاقسام'),
              leading: Image.asset('assets/menu/category.png'),
              onTap: () {
                controller.selectindex.value = 0;
                Get.back();
              },
            ),
            ListTile(
              title: Text('الماركات'),
              leading: Image.asset('assets/menu/brand.png'),
              onTap: () {
                controller.selectindex.value = 1;
                Get.back();
              },
            ),
            ListTile(
              title: Text('سلة التسوق'),
              leading: Image.asset('assets/menu/shopping.png'),
              onTap: () {
                controller.selectindex.value = 3;
                Get.back();
              },
            ),
            ListTile(
              title: Text('حسابى'),
              leading: Image.asset('assets/menu/user.png'),
              onTap: () {
                controller.selectindex.value = 4;
                Get.back();
              },
            )
          ],
        ),
      ),
*/   
   
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(color: Colors.black),
        title: SizedBox(
          height: 100,
          child: Image.asset('assets/logo.png'),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: custembottomNavigationBar(),
      body: Obx(() {
        return IndexedStack(
          index: controller.selectindex.value,
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
         
          index: controller.selectindex.value,
          animationDuration: const Duration(milliseconds: 400),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Color(0xFF4C1711),
          color: Colors.white,
          height: 75,
          items: [
            SvgPicture.asset(
              'assets/menu/category.svg',
              width: controller.selectindex.value == 0 ? 32 : 20,
              color: controller.selectindex.value == 0
                  ? Colors.white
                  : Color(0xFF4C1711),
            ),
            SvgPicture.asset(
              'assets/menu/brands.svg',
              width: controller.selectindex.value == 1 ? 32 : 20,
              color: controller.selectindex.value == 1
                  ? Colors.white
                  : Color(0xFF4C1711),
            ),
            SvgPicture.asset(
              'assets/menu/home.svg',
              width: controller.selectindex.value == 2 ? 32 : 20,
              color: controller.selectindex.value == 2
                  ? Colors.white
                  : Color(0xFF4C1711),
            ),
            SvgPicture.asset(
              'assets/menu/shopping.svg',
              width: controller.selectindex.value == 3 ? 32 : 20,
              color: controller.selectindex.value == 3
                  ? Colors.white
                  : Color(0xFF4C1711),
            ),
            SvgPicture.asset(
              'assets/menu/user.svg',
              width: controller.selectindex.value == 4 ? 32 : 20,
              color: controller.selectindex.value == 4
                  ? Colors.white
                  : Color(0xff4C1711),
            ),
          ],
          onTap: (value) {
            controller.selectindex.value = value;
          },
        );
      }),
    );
  }

  Widget loginuser() {
    return Center(
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
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red, // background
            onPrimary: Colors.white, // foreground
          ),
          onPressed: () {
            Get.toNamed(Routes.SigninView);
          },
          child: Text('تسجيل دخول'),
        )
      ],
    ));
  }
}
