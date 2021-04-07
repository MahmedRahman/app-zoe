import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomButton.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
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
      body: Obx(
        () {
          return ListView(
            children: [
              SizedBox(
                height: Get.height * .6,
                child: FutureBuilder(
                    future: controller.getCartItem(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<CartItem> listCartItem = snapshot.data;
                        return Column(
                            children:
                                List.generate(listCartItem.length, (index) {
                          CartItem _cartitem = listCartItem.elementAt(index);
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
                                  _cartitem.ProductPrice.toString()),
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
                        }).toList());
                      } else if (snapshot.hasError) {
                        return Text('hasError');
                      }
                      return Text('ddddddd');
                    }),
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
                      subtitle:
                          Text(controller.cartTotalProductPrice().toString()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RaisedButton.icon(
                      onPressed: () {
                        if (Get.find<UserAuth>().getUserToken() == null) {
                          showSnackBar(
                              title: appName,
                              message:
                                  'برجاء تسجيل الدخول لتمكن من اتمام الطلب',
                              snackbarStatus: () {
                                Get.toNamed(Routes.SigninView);
                              });
                        } else {
                          Get.toNamed(Routes.CartCheckOutView);
                        }
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
          );
        },
      ),
    );
  }
}
