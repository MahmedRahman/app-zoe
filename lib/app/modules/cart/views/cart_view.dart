import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/data/component/CustomButton.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/cart/model/CartItem.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class CartView extends StatelessWidget {
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GetX<CartController>(
            builder: (controller) {
              return SizedBox(
                height: Get.height * .6,
                child: FutureBuilder(
                  future: controller.listCartItemFutter.value,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CartItem> listCartItem = snapshot.data;
                      if (listCartItem.length == 0) {
                        return Column(
                          children: [
                            LottieBuilder.asset('assets/cartnoproduct.json'),
                            Text(
                              'لا توجد منتجات',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        );
                        ;
                      } else {
                        return ListView(
                          children: [
                            Column(
                              children: List.generate(
                                listCartItem.length,
                                (index) {
                                  CartItem _cartitem =
                                      listCartItem.elementAt(index);
                                  return Card(
                                    child: ListTile(
                                      leading: SizedBox(
                                        width: 32,
                                        child: CustomImageCached(
                                          imageUrl: _cartitem.productimage,
                                        ),
                                      ),
                                      title: Text(_cartitem.productName),
                                      subtitle: Text(_cartitem.qty.toString() +
                                          " - " +
                                          _cartitem.productPrice.toString() +
                                          ' ' +
                                          'ريال'),
                                      trailing: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.red, // background
                                          // foreground
                                        ),
                                        onPressed: () {
                                          controller.carClearItem(index);
                                        },
                                        child: Icon(Icons.delete),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
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
                                      ),
                                    ),
                                    title: Text('المجموع'),
                                    subtitle: Text(
                                      controller
                                              .cartTotalProductPrice()
                                              .toStringAsFixed(0) +
                                          ' ' +
                                          'ريال',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red, // background
                                      onPrimary: Colors.white, // foreground
                                    ),
                                    onPressed: () {
                                      controller.cartComplete();
                                    },
                                    child: Text('أنهاء الطلب'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Center(
                        child: CustomIndicator(
                          indicatorStatus: IndicatorStatus.error,
                        ),
                      );
                    }
                    return Center(child: CustomIndicator());
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
