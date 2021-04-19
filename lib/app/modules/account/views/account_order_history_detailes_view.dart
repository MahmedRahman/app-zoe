import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/account/model/order_history_detailes_model.dart';

class AccountOrderHistoryDetailesView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      body: FutureBuilder(
          future: controller.getOrderDetailesHistory(Get.arguments[0]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Data ProductHistory = snapshot.data;
              return ListView(
                children: [
                  SizedBox(height: 15),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'بيانات الطلب',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      color: Colors.grey.withOpacity(.3),
                      child: Column(
                        children: [
                          ListTile(
                            dense: true,
                            leading: Text('رقم الطلب'),
                            title: Text(ProductHistory.order.id.toString()),
                            // leading: Icon(Icons.history,color: Colors.red),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text('التاريخ'),
                            title: Text(DateFormat("MMMM-dd")
                                .format(ProductHistory.order.orderDate)
                                .toString()),
                            // leading: Icon(Icons.history,color: Colors.red),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text('ألعنوان'),
                            title: Text(ProductHistory.order.address),
                            // leading: Icon(Icons.location_pin ,color: Colors.red,),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text('الحالة'),
                            title: Text(ProductHistory.order.status.toString()),
                            //leading: Icon(Icons.local_shipping, color: Colors.red),
                          ),
                          ListTile(
                            dense: true,
                            leading: Text('أجمالى السعر'),
                            title: Text(
                                ProductHistory.order.orderTotal.toString()),
                            // leading: Icon(Icons.money, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'المنتجات المطلوبة',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Column(
                    children:
                        List.generate(ProductHistory.items.length, (index) {
                      Item CartItem = ProductHistory.items.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Card(
                          elevation: 2,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: Get.width * .2,
                                    child: CustomImageCached(
                                      imageUrl: CartItem.image.toString(),
                                    ),
                                  ),
                                  Container(
                                    width: Get.width * .7,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          dense: true,
                                          title: Text(
                                            CartItem.name.toString(),
                                          ),
                                        ),
                                        ListTile(
                                          dense: true,
                                          leading: Text('العدد'),
                                          title: Text(
                                            CartItem.qty.toString(),
                                          ),
                                        ),
                                        ListTile(
                                          dense: true,
                                          leading: Text('السعر'),
                                          title: Text(
                                            CartItem.price.toString(),
                                          ),
                                        ),
                                        GetUtils.isNullOrBlank(CartItem.color)
                                            ? SizedBox.shrink()
                                            : ListTile(
                                                leading: Text('اللون'),
                                                title: Text(
                                                  CartItem.color.toString(),
                                                ),
                                              ),
                                        GetUtils.isNullOrBlank(CartItem.size)
                                            ? SizedBox.shrink()
                                            : ListTile(
                                                leading: Text('الحجم'),
                                                title: Text(
                                                  CartItem.size.toString(),
                                                ),
                                              ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                  child:
                      CustomIndicator(indicatorStatus: IndicatorStatus.error));
            }
            return Center(child: CustomIndicator());
          }),
    );
  }
}
