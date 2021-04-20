import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
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
    return CupertinoTabScaffold(
      
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.departure_board),label: 'الاقسام'),
          BottomNavigationBarItem(icon: Icon(Icons.branding_watermark),label :'الماركات'),
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'الرئسية' ),
          BottomNavigationBarItem(icon: Icon(Icons.shop),label: 'سلة المشتريات'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance),label: 'حسابى'),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CategoryView(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: BrandView(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomePage(),
              );
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CartView(),
              );
            });
          case 4:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: (Get.find<UserAuth>().getUserToken() == null)
                    ? loginuser()
                    : AccountView(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CategoryView(),
              );
            });
        }
      },
    );
  }
}

/*
Scaffold(
      appBar: CustemAppBar(),
      bottomNavigationBar:custembottomNavigationBar() ,
      body: Obx(
         () {
          return stack[controller.selectindex.value];
        }
      ),
    );
  }
*/
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
        index: Get.find<HomeController>().selectindex.value,
        animationDuration: const Duration(milliseconds: 400),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.red,
        color: Colors.white,
        height: 75,
        items: [
          SvgPicture.asset(
            'assets/menu/category.svg',
            width: Get.find<HomeController>().selectindex.value == 0 ? 32 : 20,
            color: Get.find<HomeController>().selectindex.value == 0
                ? Colors.white
                : Colors.red,
          ),
          SvgPicture.asset(
            'assets/menu/brands.svg',
            width: Get.find<HomeController>().selectindex.value == 1 ? 32 : 20,
            color: Get.find<HomeController>().selectindex.value == 1
                ? Colors.white
                : Colors.red,
          ),
          SvgPicture.asset(
            'assets/menu/home.svg',
            width: Get.find<HomeController>().selectindex.value == 2 ? 32 : 20,
            color: Get.find<HomeController>().selectindex.value == 2
                ? Colors.white
                : Colors.red,
          ),
          SvgPicture.asset(
            'assets/menu/shopping.svg',
            width: Get.find<HomeController>().selectindex.value == 3 ? 32 : 20,
            color: Get.find<HomeController>().selectindex.value == 3
                ? Colors.white
                : Colors.red,
          ),
          SvgPicture.asset(
            'assets/menu/user.svg',
            width: Get.find<HomeController>().selectindex.value == 4 ? 32 : 20,
            color: Get.find<HomeController>().selectindex.value == 4
                ? Colors.white
                : Colors.red,
          ),
        ],
        onTap: (value) {
          Get.find<HomeController>().selectindex.value = value;
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
