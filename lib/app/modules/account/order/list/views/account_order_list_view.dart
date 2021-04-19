import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/modules/account/model/order_history_model.dart';
import 'package:zoe/app/routes/app_pages.dart';

import '../controllers/account_order_list_controller.dart';

class AccountOrderListView extends GetView<AccountOrderListController> {
  Widget build(BuildContext context) {

    controller.getOrderHistory();
    return Scaffold(
      appBar: CustemAppBar(),
      body: GetX<AccountOrderListController>(
        builder: (builder) {
          return FutureBuilder(
              future: controller.OrderHistoryList.value,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Datum> ListorderItem = snapshot.data;
                  return ListView(
                    children: List.generate(ListorderItem.length, (index) {
                      Datum orderItem = ListorderItem.elementAt(index);
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(Routes.ACCOUNT_ORDER_DETAIL,
                                arguments: [orderItem.id.toString()]);
                          },
                          title: Text(DateFormat("MMMM-dd")
                              .format(orderItem.orderDate)
                              .toString()),
                          subtitle: Text(orderItem.status.toString()),
                          leading: CircleAvatar(
                            child: Text(
                              orderItem.id.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          ),
                          trailing: Text(orderItem.orderTotal.toStringAsFixed(0) + ' ' + 'ريال'),
                        ),
                      );
                    }),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: CustomIndicator(
                    indicatorStatus: IndicatorStatus.error,
                  ));
                }
                return Center(child: CustomIndicator());
              });
        }
      ),
    );
  }
}
