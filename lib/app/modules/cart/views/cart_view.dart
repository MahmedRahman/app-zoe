import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put<HomeController>(HomeController());

    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children: [
            SizedBox(
              height: Get.height * .6,
              child: ListView(
                children: List.generate(
                  homeController.getProduct().length,
                  (index) => Card(
                    child: ListTile(
                      title: Text(
                          homeController.getProduct().elementAt(index).title),
                      subtitle: Text(
                          homeController.getProduct().elementAt(index).subtitle),
                      trailing: Text('3'),
                      leading: Image.asset(
                          homeController.getProduct().elementAt(index).image),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .2,
              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(Icons.check_sharp),
                    leading: SizedBox(
                        width: 32,
                        height: 32,
                        child: Icon(
                          Icons.monetization_on_sharp,
                          size: 32,
                          color: Colors.red,
                        )),
                    title: Text('المجموع'),
                    subtitle: Text('3000'),
                  ),SizedBox(height: 15,),
                  RaisedButton.icon(
                    onPressed: () {
                      Get.toNamed(Routes.OrderPaymentView);
                    },
                    icon: Icon(
                      Icons.shop,
                      size: 32,
                      color: Colors.white,
                    ),
                    label: Text('أنهاء الطلب'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
