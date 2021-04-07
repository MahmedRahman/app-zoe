import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/account/model/account_adrees_model.dart';

class AccountAdressView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(content: Text('data'));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: controller.getAccountAdress(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datum> AccountAddress = snapshot.data;
              return ListView(
                  children: List.generate(AccountAddress.length, (index) {
                Datum Address = AccountAddress.elementAt(index);
                return Card(
                  child: ListTile(
                    title: Text(Address.address.toString()),
                    subtitle: Text(Address.city.toString()),
                    trailing:
                        IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                  ),
                );
              }).toList());
            } else if (snapshot.hasError) {
              return Center(
                child: CustomIndicator(),
              );
            }
            return Center(
              child: CustomIndicator(),
            );
          }),
    );
  }
}
