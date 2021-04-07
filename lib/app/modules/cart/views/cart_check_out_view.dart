import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/component/CustomButton.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';

class CartCheckOutView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text('المنتجات'),
              trailing: Text(controller.cartCount().toString()),
              leading: Icon(
                Icons.shopping_cart,
                size: 32,
                color: Colors.red,
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('اجمالى السعر'),
              trailing: Text(controller.cartTotalProductPrice().toString()),
              leading: Icon(
                Icons.payment,
                size: 32,
                color: Colors.red,
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('الشحن'),
              trailing: Text('50'),
              leading: Icon(
                Icons.car_rental,
                size: 32,
                color: Colors.red,
              ),
            ),
          ),
          ListTile(
            title: Text('الأجمالى بعد الخصم'),
            trailing: Text(controller.cartTotalPrice().toString()),
          ),
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
          ListTile(
            title: Text(
                'السراج سيتى مول, ش عطية الصوالحي، المنطقة الثامنة، مدينة نصر، محافظة القاهرة‬'),
            //leading: Image.asset('assets/payment/cash.png'),
          ),
          /* ListTile(
            title: Text('البطاقة  الإتمانية'),
            leading: Image.asset('assets/payment/visa.png'),
          ),*/
          SizedBox(
            height: 15,
          ),
          CustomButton(
            buttonController: controller.buttonController,
            title: 'أدفع',
            onPressed: () {
              controller.checkout();
              
            },
          )
        ],
      ),
    );
  }
}
