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
      body: WillPopScope(
        onWillPop: () async {
          controller.discount.value = 0;
          controller.PromoCode.clear();
          return true;
        },
        child: Padding(
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
                      '${((100 * (controller.cartTotalProductPrice() / (100 + tax)))).roundToDouble().toStringAsFixed(0)} ريال',
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
                    title: Text('الضريبة 15%'),
                    trailing: Text(
                      //'${tax.toString()} %'
                      '${(controller.cartTotalProductPrice() - (100 * (controller.cartTotalProductPrice() / (100 + tax)))).roundToDouble().toStringAsFixed(0)} ريال',
                    ),
                    leading: Icon(
                      Icons.payment,
                      size: 32,
                      color: Color(0xff4C1711),
                    ),
                  ),
                ),
                /* Card(
                  child: ListTile(
                    title: Text('مبلغ الضريبة'),
                    trailing: Text(
                      '${((controller.cartTotalProductPrice() / tax)).roundToDouble().toStringAsFixed(0)} ريال',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    leading: Icon(
                      Icons.payment,
                      size: 32,
                      color: Color(0xff4C1711),
                    ),
                  ),
                ),*/
                Card(
                  child: ListTile(
                    title: Text('الشحن'),
                    trailing: Text(controller.shappingPrice.value.toString() +
                        ' ' +
                        'ريال'),
                    leading: Icon(
                      Icons.car_rental,
                      size: 32,
                      color: Color(0xff4C1711),
                    ),
                  ),
                ),
                Obx(() {
                  return Card(
                    child: ListTile(
                      title: DropdownButtonFormField(
                        itemHeight: 60,
                        onChanged: (index) {
                          print(index['id']);
                          controller.delivaryfeed.value =
                              index['additional_fees'];

                          controller.paymethods = index['id'];
                          //print(delivery_fees.elementAt(index)['additional_fees']);
                        },
                        validator: (v) {
                          if (v == null) {
                            return 'برجاء اختيار طريقة دفع';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'اختيار طريقة دفع',
                          //border: OutlineInputBorder(),
                        ),
                        items: List.generate(
                          delivery_fees.length,
                          (index) => DropdownMenuItem(
                            value: delivery_fees.elementAt(index),
                            child: Text(
                              '${delivery_fees.elementAt(index)['title']}',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      trailing: Text(
                          controller.delivaryfeed.value.toString() + 'ريال'),
                    ),
                  );
                }),
                Card(
                  child: ListTile(
                    title: TextField(
                      controller: controller.PromoCode,
                      decoration: InputDecoration(hintText: 'كود الخصم'),
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        controller.getPromoCodeChecker();
                      },
                      child: Text('تنفيذ'),
                    ),
                    leading: Icon(
                      Icons.local_offer,
                      size: 32,
                      color: Color(0xff4C1711),
                    ),
                  ),
                ),
                Obx(() {
                  return Column(
                    children: [
                      controller.discount.value == 0
                          ? SizedBox.shrink()
                          : Card(
                              child: ListTile(
                                title: Text('الخصم'),
                                trailing: Text(
                                    controller.discount.value.toString() +
                                        ' ' +
                                        '%'),
                                leading: Icon(
                                  Icons.local_offer,
                                  size: 32,
                                  color: Color(0xff4C1711),
                                ),
                              ),
                            ),
                      Card(
                        child: ListTile(
                          title: Text(
                            'الاجمالى ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            controller.cartTotalPrice().toStringAsFixed(0) +
                                ' ' +
                                'ريال',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: Icon(
                            Icons.money,
                            size: 32,
                            color: Color(0xff4C1711),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                /*Padding(
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
                  leading: Icon(Icons.fact_check),
                  trailing: Text(
                    '20 ريال',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
             
             */
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'وقت التوصيل',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(controller.deliveryDays.value),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'العنوان',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                  height: 30,
                ),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.checkout();
                      },
                      child: Text('اتمام عملية الشراء')),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
