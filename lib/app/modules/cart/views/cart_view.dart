import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/component/CustomButton.dart';
import 'package:zoe/app/component/CustomImageCached.dart';
import 'package:zoe/app/component/CustomIndicator.dart';
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
      body: GetX<CartController>(
        builder: (controller) {
          return FutureBuilder(
            future: controller.listCartItemFutter.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CartItem> listCartItem = snapshot.data;
                if (listCartItem.length == 0) {
                  return ListView(
                    children: [
                      LottieBuilder.asset('assets/cartnoproduct.json'),
                      Center(
                        child: Text(
                          'لا توجد منتجات',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
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
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: SizedBox(
                                      width: 32,
                                      child: CustomImageCached(
                                        imageUrl:
                                            _cartitem.productimage,
                                      ),
                                    ),
                                    title:
                                        Text(_cartitem.productName),
                                    trailing: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color(0xff4C1711), // background
                                        // foreground
                                      ),
                                      onPressed: () {
                                        controller
                                            .carClearItem(index);
                                      },
                                      child: Icon(Icons.delete),
                                    ),
                                  ),
                                  ListTile(
                                    leading:
                                        Icon(Icons.queue_play_next),
                                    title: Text('العدد'),
                                    trailing: Text(
                                      _cartitem.qty.toString(),
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.money),
                                    title: Text('السعر'),
                                    trailing: Text(
                                      _cartitem.totalprice
                                          .toString(),
                                    ),
                                  ),
                                 _cartitem.productSize==0 ? SizedBox.shrink() : ListTile(
                                    leading: Icon(Icons.line_weight),
                                    title: Text('الحجم'),
                                    trailing: Text(
                                      _cartitem.productSizeName
                                          .toString(),
                                    ),
                                  ),
                                 _cartitem.productColor==0 ? SizedBox.shrink() : ListTile(
                                    leading: Icon(Icons.color_lens),
                                    title: Text('اللون'),
                                    trailing: Text(
                                      _cartitem.productColorName
                                          .toString(),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      ListTile(
                        trailing: Icon(Icons.check_sharp),
                        leading: SizedBox(
                          width: 32,
                          height: 32,
                          child: Icon(
                            Icons.monetization_on_sharp,
                            size: 32,
                            color: Color(0xff4C1711),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff4C1711), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              controller.cartAddress();
                              Kaddress.value='';
                            },
                            child: Text('متابعة'),
                          ),
                        ),
                      ),  SizedBox(
                        height: 15,
                      ),
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
          );
        },
      ),
    );
  }
}
