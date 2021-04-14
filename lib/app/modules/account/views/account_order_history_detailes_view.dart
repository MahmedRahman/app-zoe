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
              return Column(
                children: [
                  Card(
                    child: ListTile(
                      title: Text('تاريخ الطلب'),
                      subtitle: Text(DateFormat("MMMM-dd")
                          .format(ProductHistory.order.orderDate)
                          .toString()),
                      leading: Icon(Icons.history),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('أجمالى السعر'),
                      subtitle:
                          Text(ProductHistory.order.orderTotal.toString()),
                      leading: Icon(Icons.money),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('حالة الطلب'),
                      subtitle: Text(ProductHistory.order.status.toString()),
                      leading: Icon(Icons.local_shipping),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('ألعنوان'),
                      subtitle: Text(ProductHistory.order.address),
                      leading: Icon(Icons.location_pin),
                    ),
                  ),
                  Column(
                    children:
                        List.generate(ProductHistory.items.length, (index) {
                      Item CartItem = ProductHistory.items.elementAt(index);
                      return ListTile(
                        title: Text(CartItem.name.toString(),overflow: TextOverflow.ellipsis,),
                        subtitle: Text(CartItem.qty.toString()),
                        trailing: Text(CartItem.total.toString()),
                        leading: SizedBox(
                            width: 32,
                            height: 32,
                            child: CustomImageCached(
                              imageUrl: CartItem.image.toString(),
                            )),
                        
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
