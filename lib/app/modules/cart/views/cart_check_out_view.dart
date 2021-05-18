import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:zoe/app/component/CustomAppBar.dart';
import 'package:zoe/app/component/CustomButton.dart';
import 'package:zoe/app/component/CustomIndicator.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/account/adress/list/controllers/account_adress_list_controller.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/account/model/account_adrees_model.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';

class CartCheckOutView extends GetView<CartController> {
  String _character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  title: Text('عدد المنتجات'),
                  trailing: Text(controller.cartCount().toString()),
                  leading: Icon(
                    Icons.shopping_cart,
                    size: 32,
                    color: Color(0xff4C1711),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('السعر'),
                  trailing: Text(
                    controller.cartTotalProductPrice().toStringAsFixed(0) +
                        ' ' +
                        'ريال',
                  ),
                  leading: Icon(
                    Icons.payment,
                    size: 32,
                    color: Color(0xff4C1711),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('الشحن'),
                  trailing: Text(
                      controller.shappingPrice.value.toString() + ' ' + 'ريال'),
                  leading: Icon(
                    Icons.car_rental,
                    size: 32,
                    color: Color(0xff4C1711),
                  ),
                ),
              ),
              Obx(() {
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text('الخصم'),
                        trailing: Text(controller.discount.value.toString() +
                            ' ' +
                            'ريال'),
                        leading: Icon(
                          Icons.local_offer,
                          size: 32,
                          color: Color(0xff4C1711),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.money),
                      title: Text(
                        'الإجمالى',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        controller.cartTotalPrice().toStringAsFixed(0) +
                            ' ' +
                            'ريال',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'طريقة الدفع',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              ListTile(
                title: Text('الدفع عند الاستلام'),
                leading: Image.asset('assets/payment/cash.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'العنوان',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              Obx(
                () {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      Kaddress.toString(),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'كود الخصم',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.PromoCode,
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          controller.getPromoCodeChecker();
                        },
                        child: Text('تنفيذ'))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                buttonController: controller.buttonController,
                title: 'اتمام عملية الشراء',
                onPressed: () {
                  controller.checkout();
                },
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
