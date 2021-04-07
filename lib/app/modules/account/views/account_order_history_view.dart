import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/account/model/order_history_model.dart';
import 'package:zoe/app/routes/app_pages.dart';

class AccountOrderHistoryView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: SizedBox(
          height: 100,
          child: Image.asset('assets/logo.png'),
        ),
        centerTitle: true,
       
      ),
      body: FutureBuilder(
          future: controller.getOrderHistory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datum> ListorderItem = snapshot.data;
              return ListView(
                children: List.generate(ListorderItem.length, (index) {
                  Datum orderItem = ListorderItem.elementAt(index);
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Get.toNamed(Routes.AccountOrderHistoryDetailesView,arguments: [orderItem.id.toString()]);
                      },
                      title: Text(DateFormat("MMMM-dd").format(orderItem.orderDate).toString()),
                      subtitle: Text(orderItem.city.toString()),
                      leading: Text(orderItem.id.toString()),
                      trailing: Text(orderItem.orderTotal.toString()),
                    ),
                  );
                }),
              );
            } else if (snapshot.hasError) {
              return Center(child: CustomIndicator(indicatorStatus: IndicatorStatus.error,));
            }
            return Center(child: CustomIndicator());
          }),
    );
  }
}
