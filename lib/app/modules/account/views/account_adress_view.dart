import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/account/model/account_adrees_model.dart';
import 'package:zoe/app/routes/app_pages.dart';

class AccountAdressView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.AccountAddAdressView);
        },
        child: Icon(Icons.add),
      ),
      body: GetX<AccountController>(builder: (controller) {
        return FutureBuilder(
            future: controller.AdreesModel.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Datum> AccountAddress = snapshot.data;
                AccountAddress.sort((b, a) => a.id.compareTo(b.id));

                return ListView(
                    children: List.generate(AccountAddress.length, (index) {
                  Datum Address = AccountAddress.elementAt(index);
                  return Card(
                    child: ListTile(
                      title: Text(Address.address.toString()),
                      subtitle: Text(Address.city.toString()),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          controller.deleteUserAddress(
                              userAddresId: Address.id);
                        },
                      ),
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
            });
      }),
    );
  }
}
